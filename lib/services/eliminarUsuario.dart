import 'package:http/http.dart' as http;

void eliminar(String id) async {
  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/actualizarEstado.php');

  var response = await http.post(url, body: {
    'Id': id
  });
}
