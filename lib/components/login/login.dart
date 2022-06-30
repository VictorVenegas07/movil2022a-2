import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/components/home/home.dart';
import 'package:movil2022a/components/navegador/navegadorBar.dart';
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/models/userlog.dart';
import 'package:movil2022a/services/adicionarUsuario.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController controladorUser = new TextEditingController();
  late TextEditingController controladorPassword = new TextEditingController();
  final userController = Get.put(UsuarioController());
  late Future<List<UsuarioLog>> createpost;
  late List<UsuarioLog> usuario;
  buscar() async {
    createpost = validarClientePost(http.Client(), controladorUser.text, controladorPassword.text);
  }

  validarCampos() {
    return controladorUser.text.length < 1
        ? false
        : controladorPassword.text.length < 1
            ? false
            : true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  //color: Colors.blue[300],
                  ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/originals/55/6c/38/556c381559c59fd2231498de3014e7c2.png"),
                backgroundColor: Colors.blue[500],
                radius: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controladorUser,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Usuario",
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controladorPassword,
                cursorRadius: Radius.circular(70.0),
                obscureText: true,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.verified_user),
                  fillColor: Colors.white,
                  labelText: "Contraseña",
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.blue[800],
                padding: const EdgeInsets.symmetric(vertical: 15),
                textColor: Colors.white,
                onPressed: () async {
                  await entrar(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Iniciar sesion"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> entrar(BuildContext context) async {
    usuario = [];
    if (validarCampos()) {
      await buscar();
      createpost.then((value) {
        usuario = value;
        if (value[0].tipo == 'Cliente') {
          validarUsuario(value[0]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigatorBar()));
        }else if(value[0].tipo == 'Admin'){
           validarUsuario(value[0]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()));
        }
        
      });
    } else {
      mostrarMensaje(context,
          "Usuario y password no deben ser vacio o menor a 5 caracteres");
    }
  }

  validarUsuario(UsuarioLog response) {
    if (response != null) {
      userController.logIn(response);
      Obx(() => Text(userController.user.value.tipo));
      return response;
    }
    return response;
  }

  logIn(dynamic data) {
    print("" + data[0].tipo);
    return true;
  }

  Widget getUsuario(BuildContext context, String password, String user) {
    return FutureBuilder(
      future: validarClientePost(http.Client(), user, password),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return snapshot.data != null
                ? logIn(snapshot.data)
                : Text("No hay data");
          default:
            return Text("Recargar los datos");
        }
      },
    );
  }
}

Future<dynamic> mostrarMensaje(BuildContext context, String? mensaje) {
  return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text('Error'), content: Text(mensaje!)));
}
