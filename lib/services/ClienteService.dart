import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/models/cliente.dart';

Future<List<Cliente>> listarClientePost(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await http.get(Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/consultarClientes.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

List<Cliente> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Cliente>((json) => Cliente.fromJson(json)).toList();
}

void validarUsuario(String user, String password) async {
  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/validar.php');

  await http.post(url, body: {
    'user':user,
    'password':password
  });
}

Future<List<Cliente>> validarClientePost(http.Client client, String user, String password) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";

  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/validar.php');

  final response = await http.post(url, body: {
    'user':user,
    'password':password
  });

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas2, response.body);
}

List<Cliente> pasaraListas2(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Cliente>((json) => Cliente.fromJson(json)).toList();
}
