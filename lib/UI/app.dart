import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil2022a/components/home/home.dart';
import 'package:movil2022a/components/login/LoginPage.dart';
import 'package:movil2022a/controllers/usuarioController.dart';

class MyProyect extends StatefulWidget {
  const MyProyect({Key? key}) : super(key: key);

  @override
  _MyProyectState createState() => _MyProyectState();
}

class _MyProyectState extends State<MyProyect> {
  final userController = Get.put(UsuarioController());
  int index = 1;
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  getDrawerItem(int index) {
    switch (index) {
      case 1:
        return LoginPage();
      case 2:
        return Home();
    }
  }

  _loadCounter() {
     Obx(() => Text(userController.user.value.tipo));
    if (userController.user.value.user != null) {
      setState(() {
        index = 2;
        print(index);
      });
    } else {
      setState(() {
        index = 1;
         print(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sin limites",
      home: getDrawerItem(index),
    );
  }
}
