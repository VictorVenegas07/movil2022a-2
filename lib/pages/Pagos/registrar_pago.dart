import 'package:flutter/material.dart';

class RegistarPago extends StatefulWidget {
  RegistarPago({Key? key}) : super(key: key);

  @override
  State<RegistarPago> createState() => _RegistarPagoState();
}

class _RegistarPagoState extends State<RegistarPago> {
  String value = 'Seleccione';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 450,
                    child: DropdownButton<String>(
                      value: value,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 15,
                      style: const TextStyle(color: Colors.grey),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          value = newValue!;
                        });
                      },
                      items: <String>[
                        'Seleccione',
                        'Mensual',
                        'Quincenal',
                        'Dia'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ]),
              Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textoDoumento()
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textoCantidad()
                  ],
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textoValor()
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  botonRegistrar()
                  ],
              )
            ],
          ),
        ));
  }
}

Widget textoDoumento() {
  return Container(
    child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                 width: 450,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Numero de identificacion",
                  ),
                ),
              ),
            ),
  );
}

Widget textoCantidad() {
  return Container(
    child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                 width: 450,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Cantidad",
                  ),
                ),
              ),
            ),
  );
}

Widget textoValor() {
  return Container(
    child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                 width: 450,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Valor",
                  ),
                ),
              ),
            ),
  );
}

Widget botonRegistrar() {
  return Container(
    child: Padding(
               padding: const EdgeInsets.all(60.0),
               child: SizedBox(
                 height: 40,
                 width: 300,
                 child: RaisedButton(
                   padding: const EdgeInsets.symmetric(vertical: 5),
                  textColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                   color: Colors.blue[800],
                   onPressed: (){},
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Registrar"),
                                
                                ],
                   ),

                 ),
               ),
             )
  );
}