import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/models/userlog.dart';
import 'package:movil2022a/pages/cliente/datosGenerales.dart';
import 'package:movil2022a/services/adicionarUsuario.dart';

class EditarCliente extends StatefulWidget {
  EditarCliente({Key? key}) : super(key: key);

  @override
  State<EditarCliente> createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  final controller = Get.put(UsuarioController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text("Configuracion", textAlign: TextAlign.center),
        ),
        body: getDatosGenerales());
  }

  Widget datos(UsuarioLog usuario) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          MaterialButton(
            child: Text(
              'Datos Generales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DatosGenerales()))
                  .then((value) {
                setState(() {
                  getDatosGenerales();
                });
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text('Tipo documento :  ${usuario.tipoDocumento}'),
          ),
          ListTile(
            title: Text('Documento :  ${usuario.numeroDocumento}'),
          ),
          ListTile(
            title: Text('Nombres :  ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Apellidos :  ${usuario.apellido}'),
          ),
          ListTile(
            title: Text('Telefono :  ${usuario.telefono}'),
          ),
          ListTile(
            title: Text('Estado :  ${estado(usuario.estado)}'),
          ),
          MaterialButton(
            child: Text('Credenciales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onPressed: () => {},
          ),
          Divider(),
          ListTile(
            title: Text('ID :  ${usuario.id}'),
          ),
          ListTile(
            title: Text('Email :  ${"email@gamil.com"}'),
          ),
          ListTile(
            title: Text('User :  ${usuario.user}'),
          ),
          ListTile(
            title: Text('password :  ************'),
          ),
        ],
      ),
    );
  }

  Widget getDatosGenerales() {
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
                ? datos(snapshot.data[0])
                : Text("No hay data");
          default:
            return Text("Recargar los datos");
        }
      },
    );
  }

  estado(String estado) {
    return estado == "1" ? "Activo" : "";
  }
}
