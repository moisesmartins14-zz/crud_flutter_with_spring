import 'package:crud/app/controller/editPerfilController.dart';
import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/ui/android/editPerfil/perfilEditInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditarPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Editar'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MyTextFields(),
      ),
    );
  }
}
