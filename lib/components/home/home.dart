import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:movil2022a/components/login/LoginPage.dart';
import 'package:movil2022a/components/profile/profile.dart';
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/models/userlog.dart';
import 'package:movil2022a/pages/Consultas.dart';
import 'package:movil2022a/pages/Pagos/registrar_pago.dart';
import 'package:movil2022a/pages/cliente/RegistrarCliente.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  late var userController;
  int item = 0;
  String title = 'Inicio';
  @override
  void initState() {
    userController = Get.put(UsuarioController());
    validarUser();
    super.initState();
  }

  validarUser() {
    if (userController.log.tipo == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  getDrawerItem(int index) {
    switch (index) {
      case 0:
        return Center();
      case 1:
        title = 'Registo';
        return RegistrarCliente();

      case 2:
        return RegistarPago();

      case 3:
        return Consultas();
      case 4:
        return Profile();
      case 5:
        cerrar();
        // userController.logIn(new UsuarioLog());
        //  Obx(() => Text(userController.user.value.tipo));
        return LoginPage();
      default:
    }
  }

  onSelecItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      item = pos;
    });
  }

  onSelecTitle(String titulo) {
    setState(() {
      title = titulo;
      print(title);
    });
  }

  titulo(String titulo) {
    return Text(titulo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: titulo(title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userController.log.user),
              accountEmail: Text(userController.log.user),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(userController.log.foto),
              ),
              arrowColor: Colors.blue,
            ),
            ListTile(
              title: Text('Registrar cliente'),
              leading: Icon(Icons.person),
              selected: (item == 1),
              onTap: () {
                onSelecTitle('Registrar cliente');
                onSelecItem(1);
              },
            ),
            ListTile(
              title: Text('Registrar pago'),
              leading: Icon(Icons.supervised_user_circle_outlined),
              selected: (item == 2),
              onTap: () {
                onSelecTitle('Registrar pago');
                onSelecItem(2);
              },
            ),
            ListTile(
              title: Text('Consultas'),
              leading: Icon(Icons.search),
              selected: (item == 3),
              onTap: () {
                onSelecTitle('Consultas');
                onSelecItem(3);
              },
            ),
            Divider(
              height: 230,
            ),
            ListTile(
              title: Text('Perfil'),
              leading: Icon(Icons.account_circle),
              selected: (item == 4),
              onTap: () {
                onSelecTitle('Perfil');
                onSelecItem(4);
              },
            ),
            ListTile(
              title: Text('Cerrar sesion'),
              leading: Icon(Icons.exit_to_app),
              selected: (item == 5),
              onTap: () {
                setState(() {
                  userController.logIn(new UsuarioLog());
                  Obx(() => Text(userController.user.value.tipo));
                  cerrar();
                });
              },
            )
          ],
        ),
      ),
      body: getDrawerItem(item),
    );
  }

  cerrar() {
        Get.off(LoginPage());
  }
}
