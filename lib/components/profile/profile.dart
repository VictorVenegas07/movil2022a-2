import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movil2022a/controllers/usuarioController.dart';
import 'package:movil2022a/pages/cliente/editing_client.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final userController = Get.put(UsuarioController());
  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UsuarioController());
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userController.log.foto),
                radius: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(userController.log.user, style: TextStyle(fontSize: 35),),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditarCliente()));
                        },
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        textColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.blue[500],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book_rounded,
                                size: 60,
                              ),
                              Text(
                                "Mis datos",
                                style: TextStyle(fontSize: 20),
                              ),
                              
                            ],
                        ),
                        ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: RaisedButton(
                        onPressed: (){},
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        textColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color: Colors.blue[500],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.stacked_bar_chart,
                                size: 60,
                              ),
                              Text(
                                "Mi progreso",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                        ),
                        ),
                    ),
                   
                  ],
                  
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
