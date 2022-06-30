import 'package:flutter/material.dart';
import 'package:movil2022a/models/panel.dart';

class SesionPanel extends StatefulWidget {
  const SesionPanel({Key? key}) : super(key: key);

  @override
  State<SesionPanel> createState() => _SesionPanelState();
}

class _SesionPanelState extends State<SesionPanel> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: ListTile(
                  title: Text(item.expandedValue),
                  subtitle: const Text(
                      'Descripcion del ejercicio'),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    setState(() {
                    
                      // _data.removeWhere(
                      //     (Item currentItem) => item == currentItem);
                    });
                  }),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        )
      ],
    );
  }
}
