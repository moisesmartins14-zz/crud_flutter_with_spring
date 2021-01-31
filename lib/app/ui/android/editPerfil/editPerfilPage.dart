import 'package:crud/app/ui/android/editPerfil/perfilEditInfo.dart';
import 'package:flutter/material.dart';

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
      body: new InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: MyTextFields(),
      ),
    );
  }
}
