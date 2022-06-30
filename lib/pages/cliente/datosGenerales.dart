import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/models/userlog.dart';
import 'package:movil2022a/services/adicionarUsuario.dart';
import 'package:movil2022a/services/editarUsuario.dart';

class DatosGenerales extends StatefulWidget {
  DatosGenerales({Key? key}) : super(key: key);

  @override
  State<DatosGenerales> createState() => _DatosGeneralesState();
}

class _DatosGeneralesState extends State<DatosGenerales> {
  final formKey = GlobalKey<FormState>();
  final controller = Get.put(UsuarioController());
  final ndoumento = TextEditingController();
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final telefono = TextEditingController();

  @override
  void initState() {
    super.initState();
    llenarCampos();
  }

  llenarCampos() {
    ndoumento.text = controller.log.numeroDocumento;
    nombre.text = controller.log.nombre;
    apellido.text = controller.log.apellido;
    telefono.text = controller.log.telefono;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("Datos generales", textAlign: TextAlign.center),
      ),
      body: getDatosGenerales(),
    );
  }

  Widget datosGenerales(UsuarioLog usuario) {
    controller.logIn(usuario);
    Obx(() => Text(controller.user.value.tipo));
    llenarCampos();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(labelText: "Nº documento"),
                    controller: ndoumento,
                    validator: (value) {
                      if (value!.isEmpty) return "llene este campo";
                    }),
                TextFormField(
                    decoration: InputDecoration(labelText: "Nombre"),
                    controller: nombre,
                    validator: (value) {
                      if (value!.isEmpty) return "llene este campo";
                    }),
                TextFormField(
                    decoration: InputDecoration(labelText: "Apellidos"),
                    controller: apellido,
                    validator: (value) {
                      if (value!.isEmpty) return "llene este campo";
                    }),
                TextFormField(
                    decoration: InputDecoration(labelText: "Telefono"),
                    controller: telefono,
                    validator: (value) {
                      if (value!.isEmpty) return "llene este campo";
                    }),
                Divider(),
                MaterialButton(
                  minWidth: 200.0,
                  height: 40.0,
                  onPressed: () {
                    editarDatos();
                  },
                  color: Colors.lightBlue,
                  child: Text('Editar', style: TextStyle(color: Colors.white)),
                ),
              ],
            )),
      ),
    );
  }

  void editarDatos() {
    editarPersona(controller.log.id, ndoumento.text, nombre.text, apellido.text,
        telefono.text);
    setState(() {
      getDatosGenerales();
    });
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
                ? datosGenerales(snapshot.data[0])
                : Text("No hay data");
          default:
            return Text("Recargar los datos");
        }
      },
    );
  }
}
