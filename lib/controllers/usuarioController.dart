
import 'package:get/get.dart';
import 'package:movil2022a/models/userlog.dart';

class UsuarioController extends GetxController {
  final user = UsuarioLog().obs;

  UsuarioLog get log => user.value;

  logIn(UsuarioLog usuario) {
    
    user.value = usuario;
     print(user.value);
  }
}
