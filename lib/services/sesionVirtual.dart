import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/models/sesion.dart';

Future<List<Sesion>> listarClientePost(http.Client client) async {
  final response = await http.get(Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/consultarSesion.php'));

  return compute(pasaraSesion, response.body);
}
List<Sesion> pasaraSesion(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Sesion>((json) => Sesion.fromJson(json)).toList();
}