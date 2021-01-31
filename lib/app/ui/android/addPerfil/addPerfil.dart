import 'package:crud/app/controller/addPerfilController.dart';
import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/provider/remoteServices.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_validator/the_validator.dart';

class AddPerfil extends StatelessWidget {
  final AddPerfilController addPerfilController =
      Get.put(AddPerfilController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Adicionar'),
          automaticallyImplyLeading: false,
        ),
        body: new InkWell(

            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
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
                                // initialValue: perfil.nome,
                                textInputAction: TextInputAction.next,
                                controller: addPerfilController.nomeController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: FieldValidator.required(
                                    message: 'Nome em branco!'),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Nome"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 250, 10),
                              child: TextFormField(
                                controller: addPerfilController.cpfController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'CPF em branco!';
                                  } else {
                                    if (value.isCpf == false) {
                                      return 'CPF invalido!';
                                    } else
                                      return null;
                                  }
                                },
                                inputFormatters: [
                                  addPerfilController.cpfMaskFormatter
                                ],
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "CPF"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: addPerfilController.emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Email em branco!';
                                  } else {
                                    if (value.isEmail == false) {
                                      return 'Email invalido!';
                                    } else
                                      return null;
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Email"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 230, 10),
                              child: TextFormField(
                                inputFormatters: [
                                  addPerfilController.telefoneMaskFormatter
                                ],
                                controller:
                                    addPerfilController.telefoneController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (addPerfilController.telefoneMaskFormatter
                                          .getUnmaskedText()
                                          .length <
                                      11) {
                                    return "Numero incompleto!";
                                  } else
                                    return null;
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
                                    RemoteServices.criarPerfil(Perfil(
                                        nome: addPerfilController
                                            .nomeController.text,
                                        cpf: addPerfilController
                                            .cpfMaskFormatter
                                            .getUnmaskedText()
                                            .toString(),
                                        email: addPerfilController
                                            .emailController.text,
                                        telefone: addPerfilController
                                            .telefoneMaskFormatter
                                            .getUnmaskedText()
                                            .toString()));

                                    //TODO implentar snackBar(flush bar) >
                                    //TODO < passando o nome do perfil add pra proxima page
                                    Get.offAllNamed('/perfil');
                                  } else
                                    return print('error add page');
                                }),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ))
                ],
              ),
            )));
  }
}
