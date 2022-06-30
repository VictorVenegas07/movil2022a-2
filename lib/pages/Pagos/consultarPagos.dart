import 'package:flutter/material.dart';

class ConsultarPagos extends StatefulWidget {
  ConsultarPagos({Key? key}) : super(key: key);

  @override
  State<ConsultarPagos> createState() => _ConsultarPagosState();
}

class _ConsultarPagosState extends State<ConsultarPagos> {
  var nombre = "Esteban";
  var apellido = "Alfonso";
  var fecha = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagos')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        height: 1000,
        child: SizedBox(
          height: 300,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 50),
            children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 2),
                   child: Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      
                    ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Column(
                            children: [

                              Text("No 002"),
                              Text(nombre + " " + apellido),
                              Text(fecha.toString()),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text("Tipo"),
                            Text("Mensual"),
                            Container(
                              width: 15,
                              height: 22,
                              color: Colors.orange,
                              child: Center(
                                  child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              )),
                            )
                          ],
                        )
                      ],
                ),
                   ),
                 ),
                 Divider(),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 0),
                   child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text("No 002"),
                              Text(nombre + " " + apellido),
                              Text(fecha.toString()),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text("Tipo"),
                            
                            Text("Mensual"),
                            Container(
                              width: 15,
                              height: 22,
                              color: Colors.orange,
                              child: Center(
                                  child: Text(
                                "1",
                                style: TextStyle(color: Colors.white),
                              )),
                            )
                          ],
                        )
                      ],
                ),
                   ),
                 ),
              
            ],
          ),
        ),
      ),
    );
  }
}
