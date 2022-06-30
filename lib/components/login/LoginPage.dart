import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/components/home/home.dart';
import 'package:movil2022a/components/navegador/navegadorBar.dart';
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/models/userlog.dart';
import 'package:movil2022a/services/adicionarUsuario.dart';

class LoginPage extends StatefulWidget {
  static String id = "loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final controller = Get.put(UsuarioController());
  late Future<List<UsuarioLog>> createpost;
  late List<UsuarioLog> usuario;
  buscar() async {
    createpost = validarClientePost(
        http.Client(), controllerUsername.text, controllerPassword.text);
  }

  validarCampos() {
    return controllerUsername.text.length < 1
        ? false
        : controllerPassword.text.length < 1
            ? false
            : true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/004/980/518/non_2x/weightlifting-sports-logo-design-vector.jpg"),
                    radius: 90,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  _userTextField(),
                  SizedBox(
                    height: 15.0,
                  ),
                  _passwordTextFiel(),
                  SizedBox(
                    height: 40.0,
                  ),
                  _bottonLogin(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: "ejemplo@correo.com",
              labelText: "Correo electronico",
            ),
            controller: controllerUsername,
          ));
    });
  }

  Widget _passwordTextFiel() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "Contraseña",
                labelText: "Contraseña"),
            controller: controllerPassword,
          ));
    });
  }

  Widget _bottonLogin() {
    return SingleChildScrollView(child:
        StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              "Inciar Sesión",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Colors.amber,
          onPressed: () async {
            usuario = [];
            if (validarCampos()) {
              await buscar();
              createpost.then((value) {
                usuario = value;
                setUsuario(value[0]);
                if (value[0].tipo == 'Cliente') {
                  Get.off(NavigatorBar());
                } else if (value[0].tipo == 'Admin') {
                  Get.off(Home());
                }
              });
            } else {
              mostrarMensaje(context,
                  "Usuario y password no deben ser vacio o menor a 5 caracteres");
            }
          });
    }));
  }

  Future<dynamic> mostrarMensaje(BuildContext context, String? mensaje) {
    return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text('Error'), content: Text(mensaje!)));
  }

  setUsuario(UsuarioLog response) {
    if (response != null) {
      controller.logIn(response);
      Obx(() => Text(controller.user.value.tipo));
      return response;
    }
    return response;
  }
}
