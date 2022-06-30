import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/components/login/LoginPage.dart';
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/models/menuItem.dart';
import 'package:movil2022a/models/userlog.dart';
import 'package:movil2022a/pages/SesionVitual/sesion.dart';
import 'package:movil2022a/pages/cliente/editing_client.dart';
import 'package:movil2022a/services/adicionarUsuario.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  final controller = Get.put(UsuarioController());
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      getDatosPefil(),
      virtual(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    PopupMenuItem<MenuItem> builderItem(MenuItem item) => PopupMenuItem(
          value: item,
          child: Row(
            children: [
              Icon(item.ico, color: Colors.black, size: 20),
              const SizedBox(width: 12),
              Text(item.texto)
            ],
          ),
        );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Perfil"),
        elevation: 0,
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (item) => onselected(context, item),
              itemBuilder: (context) =>
                  MenuItems.primerItem.map(builderItem).toList()),
        ],
        backgroundColor: const Color(0xFFB4C56C).withOpacity(0),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_outlined),
            label: 'Sesión Virtual',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  onselected(BuildContext context, Object? item) {
    switch (item) {
      case MenuItems.configuracion:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EditarCliente()))
            .then((value) {
          setState(() {
            getDatosPefil();
          });
        });
        break;
      case MenuItems.cerrarSesion:
       Get.offAll(LoginPage());
        break;
    }
  }

  Widget profile(UsuarioLog usuario) {
    final double coverHeight = 280;
    final double profileHeight = 144;
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          portada(bottom, coverHeight, top, profileHeight, usuario),
          contenido(usuario),
        ],
      ),
    );
  }

  Widget getDatosPefil() {
    return FutureBuilder(
      future: validarBuscarClienteGet(http.Client(), controller.log.id),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            return snapshot.data != null
                ? profile(snapshot.data[0])
                : Text("No hay data");
          default:
            return Text("Recargar los datos");
        }
      },
    );
  }

  Widget contenido(UsuarioLog usuario) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(usuario.nombre,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(usuario.user, style: TextStyle(fontSize: 28, color: Colors.black)),
        const SizedBox(height: 16),
        Divider(),
        botonesCirculares()
      ],
    );
  }

  Row botonesCirculares() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
              ),
              child: Container(
                  padding: EdgeInsets.all(20),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue[100]),
                  child: ListTile(
                      title: Text(
                        "50KG",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "Peso",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ))),
            ),
          ],
        ),
        SizedBox(
          width: 100,
        ),
        Column(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
              ),
              child: Container(
                  padding: EdgeInsets.all(20),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue[100]),
                  child: ListTile(
                      title: Text(
                        "50KG",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        "Peso",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ))),
            ),
          ],
        )
      ],
    );
  }

  Stack portada(double bottom, double coverHeight, double top,
      double profileHeight, UsuarioLog usuario) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          color: Colors.white,
          child: Image.network(
            "https://depor.com/resizer/GBL37j4yH0bnTfvki-HS_5rpIJ4=/1200x900/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/EZS5JHEPM5DX3JMONYJQFASNR4.jpg",
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(top: top, child: imagenPerfil(profileHeight, usuario))
      ],
    );
  }

  CircleAvatar imagenPerfil(double profileHeight, UsuarioLog usuario) {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(usuario.foto),
    );
  }

  Widget virtual() {
    return ListView(
      children: [
        SesionPanel(),
      ],
    );
  }
}
