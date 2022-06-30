import 'package:http/http.dart' as http;

void editarPersona(
  String id, 
  String numeroDocumento,
  String nombre,
  String apellido,
  String telefono,
) async {
  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/modificar.php');

  var response = await http.post(url, body:{
    'Id': id,
    'numeroDocumento': numeroDocumento,
    'nombre': nombre,
    'apellido': apellido,
    'telefono': telefono
  });

  print(response.statusCode);
  print(response.body);
}
