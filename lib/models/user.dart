import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String id;
  String displayName;
  String photoURL;
  String email;

  User({ 
    required this.id, 
    required this.displayName, 
    required this.photoURL,
    required this.email,
  });
}