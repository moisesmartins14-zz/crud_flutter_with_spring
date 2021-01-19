import 'dart:ui';
import 'package:crud/app/controller/perfilController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Get.toNamed('/perfil');
                  },
                  child: Text(
                    "Obter perfil",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
