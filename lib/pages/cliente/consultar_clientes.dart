import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/models/cliente.dart';
import 'package:movil2022a/services/ClienteService.dart';
import 'package:movil2022a/services/activarUsuario.dart';
import 'package:movil2022a/services/eliminarUsuario.dart';

class ConsultarClientes extends StatefulWidget {
  ConsultarClientes({Key? key}) : super(key: key);

  @override
  State<ConsultarClientes> createState() => _ConsultarClientesState();
}

class _ConsultarClientesState extends State<ConsultarClientes> {
  List listclientes = clientes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consultar clientes")),
      body: getInfo(context),
    );
  }
  Widget body(List<Cliente> listclientes) {
  return ListView.builder(
      itemCount: listclientes.length,
      itemBuilder: (context, index) {
        return ListTile(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text("Actualizar"),
                      content: Text(
                          "${validarTexto(listclientes[index].estado.toString())}"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              
                              if (listclientes[index].estado == "1") {
                                eliminar(listclientes[index].ndoumento);
                                Navigator.pop(context);
                              } else if (listclientes[index].estado == "0") {
                                activarEstado(listclientes[index].ndoumento);
                                Navigator.pop(context);
                              }
                              setState(() {
                                getInfo(context);
                              });
                            },
                            child: Text("Yes")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No")),
                      ],
                      elevation: 24.0,
                    ),
                barrierDismissible: true);
          },
          title: Text(listclientes[index].nombrep),
          subtitle: Text(listclientes[index].ndoumento),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(listclientes[index].foto),
              radius: 20,
            ),
          ),
          trailing: Column(
            children: [
              Text("Estado"),
              SizedBox.fromSize(
                size: Size(26, 26), // button width and height
                child: ClipOval(
                  child: Material(
                    color: validarEstado(
                        listclientes[index].estado), // button color
                    child: InkWell(
                      splashColor: Colors.lightGreen, // splash color
                      onTap: () {}, // button pressed
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarClientePost(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return CircularProgressIndicator();
        case ConnectionState.done:
          return snapshot.data != null
              ? body(snapshot.data)
              : Text("No hay data");
        default:
          return Text("Recargar los datos");
      }
    },
  );
}
}





Future<void> refresh() {
  return Future.delayed(Duration(seconds: 1));
}

validarTexto(String estado) {
  return (estado == "1")
      ? "¿Esta seguro inhabilitar este registro?"
      : "¿Esta seguro de habilitar este registro?";
}

validarEstado(String estado) {
  return (estado == "1") ? Colors.lightGreen : Colors.red;
}
