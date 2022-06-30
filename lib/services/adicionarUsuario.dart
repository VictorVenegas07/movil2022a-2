import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movil2022a/models/userlog.dart';

void adicionar(String tipoDocumento, String numeroDocumento, String nombre,
    String apellido, String sexo, String telefono) async {
  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/adicionar.php');
  var response = await http.post(url, body: {
    'tipoDocumento': tipoDocumento,
    'numeroDocumento': numeroDocumento,
    'nombre': nombre,
    'apellido': apellido,
    'sexo': sexo,
    'telefono': telefono
  });

  print(response.statusCode);
  print(response.body);
}

Future<List<UsuarioLog>> validarClientePost(
    http.Client client, String user, String password) async {

  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/validar.php?user=${user}&password=${password}');

  // final response = await http.(url, body: {
  //   'user':user,
  //   'password':password
  // });

  final response = await http.get(url);
  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas2, response.body);
}

List<UsuarioLog> pasaraListas2(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<UsuarioLog>((json) => UsuarioLog.fromJson(json)).toList();
}


Future<List<UsuarioLog>> validarBuscarClienteGet(
    http.Client client, String userid) async {

  var url = Uri.parse(
      'https://tecnologyest.000webhostapp.com/ProyectSinLimites/buscarUsuario.php?id=${userid}');

  // final response = await http.(url, body: {
  //   'user':user,
  //   'password':password
  // });

  final response = await http.get(url);
  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(mapearUsuario, response.body);
}

List<UsuarioLog> mapearUsuario(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<UsuarioLog>((json) => UsuarioLog.fromJson(json)).toList();
}

