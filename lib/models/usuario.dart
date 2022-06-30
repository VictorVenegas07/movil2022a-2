class Usuario {
  var idUser;
  var nombre;
  var ndoumento;
  var estado;
  var user;
  var password;
  var email;
  var tipo;
  var telefono;
  var foto;

  Usuario(
      {
      this.idUser,  
      this.nombre,
      this.ndoumento,
      this.estado,
      this.telefono,
      this.email,
      this.tipo,
      this.user,
      this.password,
      this.foto});

    factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUser: json['Id'],
      nombre: json['nombre'],
      user:json['usuario'],
      ndoumento: json['numeroDocumento'],
      estado:  json['estado'],
      foto: json['foto'],
      tipo: json['tipo'],
      telefono: json['telefono'] 
    );
  }
}



List<Usuario> usuarios = [
  Usuario(
      nombre: 'Victor Venegas',
      ndoumento: '11029292',
      estado: 'SI',
      telefono: '3006314418',
      email: 'vvenegas@unicesar.edu.co',
      tipo: 'Administrador',
      user: 'a',
      password: 'a',
      foto:
          'https://img.freepik.com/vector-gratis/ejemplo-lindo-icono-vector-historieta-superheroe-astronauta_138676-3470.jpg?w=2000'
          ),
        
  Usuario(
      nombre: 'Esteban alfonso',
      ndoumento: '11029292',
      estado: 'SI',
      telefono: '301233456',
      email: 'ealfonso@unicesar.edu.co',
      tipo: 'Cliente',
      user: 'Esteban',
      password: 'Esteban',
      foto:
          'https://img.freepik.com/vector-gratis/extranjero-lindo-ejemplo-icono-vector-historieta-traje-astronauta-concepto-icono-tecnologia-ciencia-aislado-vector-premium-estilo-dibujos-animados-plana_138676-3537.jpg?w=2000'),
];
