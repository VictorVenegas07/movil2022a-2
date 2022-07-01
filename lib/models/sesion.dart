class Sesion {
  var id;
  var nombre;
  var dia;
  var video;
  bool isExpanded;

  Sesion({
    this.id,
    this.nombre,
    this.dia,
    this.video,
     this.isExpanded = true
  });

  factory Sesion.fromJson(Map<String, dynamic> json) {
    return Sesion(
      id: json['id'],
      nombre: json['nombre'],
      dia: json['dia'],
      video: json['video'],
    );
  }
}
