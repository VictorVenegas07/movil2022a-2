import 'package:flutter/material.dart';
import 'package:movil2022a/models/open.dart';
import 'package:movil2022a/models/panel.dart';
import 'package:movil2022a/models/sesion.dart';
import 'package:movil2022a/services/sesionVirtual.dart';
import 'package:http/http.dart' as http;

class SesionPanel extends StatefulWidget {
  const SesionPanel({Key? key}) : super(key: key);

  @override
  State<SesionPanel> createState() => _SesionPanelState();
}

class _SesionPanelState extends State<SesionPanel> {
  //final List<Item> _data = generateItems();
  late Future<List<Sesion>> sesion;
  
  Widget getdata(BuildContext context) {
  return FutureBuilder(
    future: listarClientePost(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return CircularProgressIndicator();
        case ConnectionState.done:
          return snapshot.data != null
              ? _buildPanel(snapshot.data)
              : Text("No hay data");
        default:
          return Text("Recargar los datos");
      }
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: getdata(context),
      ),
    );
  

    
  }

  Widget _buildPanel(List<Sesion>_data) {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            // setState(() {
            //   _data[index].isExpanded = false;
            // });
          },
          children: _data.map<ExpansionPanel>((Sesion item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.dia),
                );
              },
              body: ListTile(
                  title: Text(item.nombre),
                  subtitle: const Text(
                      'Descripcion del ejercicio'),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    Utils.openLink(url: item.video);
                  }),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        )
      ],
    );
  }


}
