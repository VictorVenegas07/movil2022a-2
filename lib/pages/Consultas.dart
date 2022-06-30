import 'package:flutter/material.dart';
import 'package:movil2022a/pages/Pagos/consultarPagos.dart';
import 'package:movil2022a/pages/cliente/consultar_clientes.dart';

class Consultas extends StatefulWidget {
  Consultas({Key? key}) : super(key: key);

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: SizedBox(
                height: 200,
                width: 300,
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  textColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.blue[800],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConsultarClientes()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_search,
                        size: 100,
                      ),
                      Text(
                        "Usuarios",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 200,
                width: 300,
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  textColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.blue[800],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConsultarPagos()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 100,
                      ),
                      Text(
                        "Pagos",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
