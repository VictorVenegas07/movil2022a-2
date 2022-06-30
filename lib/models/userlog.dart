// To parse required this JSON data, do
//
//     final UsuarioLog = UsuarioLogFromJson(jsonString);

import 'dart:convert';

List<UsuarioLog> usuarioLogFromJson(String str) =>
    List<UsuarioLog>.from(json.decode(str).map((x) => UsuarioLog.fromJson(x)));

String usuarioLogToJson(List<UsuarioLog> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsuarioLog {
  UsuarioLog({
    this.id,
    this.tipo,
    this.user,
    this.password,
    this.estado,
    this.foto,
    this.numeroDocumento,
    this.nombre,
    this.apellido,
    this.tipoDocumento,
    this.telefono,
  });

  var id;
  var tipo;
  var user;
  var password;
  var estado;
  var foto;
  var numeroDocumento;
  var tipoDocumento;
  var nombre;
  var apellido;
  var telefono;

  factory UsuarioLog.fromJson(Map<String, dynamic> json) {
    var user = UsuarioLog(
      id: json["id"],
      tipo: json["tipo"],
      user: json["user"],
      password: json["password"],
      estado: json["estado"],
      foto: json["foto"],
      numeroDocumento: json["numeroDocumento"],
      nombre: json["nombre"],
      tipoDocumento: json["tipoDocumento"],
      apellido: json["apellido"],
      telefono: json["telefono"],
    );
    return user;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "user": user,
        "password": password,
        "estado": estado,
        "foto": foto,
        "numeroDocumento": numeroDocumento,
      };
}
