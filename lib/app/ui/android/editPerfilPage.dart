import 'package:crud/app/controller/editPerfilController.dart';
import 'package:crud/app/data/model/perfilModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditarPerfil extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  final EditPerfilController editPerfilController =
      Get.put(EditPerfilController());
  Perfil perfil;

  EditarPerfil({this.perfil});

  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
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
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          // autofocus: true,
                          // initialValue: "${data[0]}",
                          textInputAction: TextInputAction.next,
                          controller: editPerfilController.nomeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nome em branco';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Nome"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 250, 10),
                        child: TextFormField(
                          controller: editPerfilController.cpfController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'CPF em branco';
                            } else {
                              if (value.isCpf == false) {
                                return 'CPF invalido!';
                              } else
                                return null;
                            }
                          },
                          inputFormatters: [
                            editPerfilController.cpfMaskFormatter
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "CPF"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: editPerfilController.emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email em branco';
                            } else {
                              if (value.isEmail == false) {
                                return 'Email invalido!';
                              } else
                                return null;
                            }
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Email"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 230, 10),
                        child: TextFormField(
                          inputFormatters: [
                            editPerfilController.telefoneMaskFormatter
                          ],
                          controller: editPerfilController.telefoneController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Telefone em branco';
                            } else {
                              return null;
                            }
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Telefone"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                top: 20,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text('Cancelar',
                              style: TextStyle(color: Colors.white)),
                          color: Colors.red,
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // Get.toNamed('/perfil');
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text('Dados processados com sucesso')));
                            } else
                              return null;
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
