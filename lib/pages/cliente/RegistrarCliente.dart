import 'package:flutter/material.dart';
import 'package:movil2022a/models/cliente.dart';
import 'package:movil2022a/services/adicionarUsuario.dart';

class RegistrarCliente extends StatefulWidget {
  RegistrarCliente({Key? key}) : super(key: key);

  @override
  State<RegistrarCliente> createState() => _RegistrarClienteState();
}

class _RegistrarClienteState extends State<RegistrarCliente> {
  List listclientes = clientes;
  late TextEditingController tipoDocumento;
  late TextEditingController nDocumento;
  late TextEditingController nombre;
  late TextEditingController apellido;
  late TextEditingController telefono;
  late TextEditingController sexo;
  @override
  void initState() {
    tipoDocumento = TextEditingController();
    nDocumento = TextEditingController();
    nombre = TextEditingController();
    apellido = TextEditingController();
    telefono = TextEditingController();
    sexo = TextEditingController();
    super.initState();
  }

  String dropdownValue = "Sexo";
  String value = "Tipo de documento";
  @override
  Widget build(BuildContext context) {
    //final lisItems = ["Seleccione", "Masculino", "Femenino"];
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
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
                      tipoDocumento.text = newValue;
                    });
                  },
                  items: <String>['Tipo de documento', 'T.I', 'C.C']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  controller: nDocumento,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Numero de identificacion",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  controller: nombre,
                  decoration: InputDecoration(
                    labelText: "Nombres",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  controller: apellido,
                  decoration: InputDecoration(
                    labelText: "Apellidos",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  controller: telefono,
                  decoration: InputDecoration(
                    labelText: "Telefono",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 450,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.grey),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      sexo.text = newValue;
                    });
                  },
                  items: <String>['Sexo', 'Femenino', 'Masculino']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                  onPressed: () {
                    // var cliente = new Cliente(
                    //   tipoDocumento: tipoDocumento.text,
                    //   apellido: apellido.text,
                    //   estado: 'NO',
                    //   ndoumento: nDocumento.text,
                    //   nombrep: nombre.text,
                    //   sexo: sexo.text,
                    //   telefono: telefono.text,
                    // );
                    adicionar(tipoDocumento.text, nDocumento.text, nombre.text,
                        apellido.text, sexo.text, telefono.text);
                    limpiarCampos();
                    // if (clientes.any(
                    //     (element) => element.ndoumento == nDocumento.text)) {
                    //   mostrarMensaje(context,
                    //       "Cliente con identificacion ${nDocumento.text} ya existe");
                    // } else {
                    //   cliente.crearUserCliente();
                    //   clientes.add(cliente);
                    //   tipoDocumento.clear();
                    //   apellido.clear();
                    //   nDocumento.clear();
                    //   nombre.clear();
                    //   sexo.clear();
                    //   telefono.clear();
                    // }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Registrar"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void limpiarCampos() {
    tipoDocumento.text = "";
    nDocumento.text = "";
    nombre.text = "";
    apellido.text = "";
    sexo.text = "";
    telefono.text = "";
  }
}
