import 'package:movil2022a/models/usuario.dart';

class Cliente {
  var idcliente;
  var tipoDocumento;
  var nombrep;
  var ndoumento;
  var estado;
  var telefono;
  var apellido;
  var sexo;
  var foto;

  Cliente(
      {this.idcliente,
      this.nombrep,
      this.ndoumento,
      this.estado = 'NO',
      this.telefono,
      this.apellido,
      this.sexo,
      this.tipoDocumento,
      this.foto});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
        idcliente: json['Id'],
        nombrep: json['nombre'],
        ndoumento: json['numeroDocumento'],
        estado: json['estado'],
        telefono: json['telefono'],
        apellido: json['apellido'],
        sexo: json['sexo'],
        tipoDocumento: json['tipoDocumento'], 
        foto:json['foto'] );
  }

  crearUserCliente() {
    var user = Usuario(
        nombre: nombrep,
        email: nombrep + "gmail.com",
        estado: 'SI',
        foto:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX8f7VOnz8lNzJYkzplysK2YOloLjzJoT8LA&usqp=CAU',
        ndoumento: ndoumento,
        password: ndoumento,
        user: ndoumento,
        telefono: telefono,
        tipo: 'Cliente');
    print(user);
    usuarios.add(user);
  }

  editarCliente(var id, Cliente usuario) {
    clientes.map((e) => {
          if (e.ndoumento == id)
            {
              e.nombrep = usuario.nombrep,
              e.telefono = usuario.telefono,
              e.apellido = usuario.apellido
            }
        });
  }
}

List<Cliente> clientes = [
  Cliente(
      nombrep: 'Victor ',
      ndoumento: '11029292',
      telefono: '3006314418',
      apellido: 'Venegas',
      sexo: 'Masculino',
      tipoDocumento: 'C.C'),
  Cliente(
      nombrep: 'Esteban',
      ndoumento: '11029292',
      telefono: '301233456',
      apellido: 'alfonso',
      sexo: 'Masculino',
      tipoDocumento: 'C.C'),
];
