import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/models/usuario.dart';

Future<List<Usuario>> listarUsuariosPost(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await http.get(Uri.parse(
      'https://movil88888.000webhostapp.com/API/listar.php'));
 
  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

List<Usuario> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
 
  return pasar.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}
