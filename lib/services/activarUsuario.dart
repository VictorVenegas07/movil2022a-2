import 'package:http/http.dart' as http;

void activarEstado(String id) async {
  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/activarEstado.php');

  var response = await http.post(url, body: {
    'Id': id
  });
}