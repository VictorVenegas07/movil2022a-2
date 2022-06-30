import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String texto;
  final IconData ico;

  const MenuItem({required this.texto, required this.ico});


}

class MenuItems{
    static const List<MenuItem> primerItem = [
    configuracion,
     cerrarSesion
  ];
  static const List<MenuItem> segundoItem = [
    cerrarSesion,
  ];
  static const configuracion = MenuItem(
    texto: 'Configuracion',
    ico: Icons.settings
  );

   static const cerrarSesion = MenuItem(
    texto: 'Cerrar sesion',
    ico: Icons.exit_to_app
  );
}
