import 'package:crud/app/controller/perfilController.dart';
import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/provider/remoteServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PerfilController perfilController = Get.put(PerfilController());

class MyCard extends StatelessWidget {
  final Perfil perfil;

  const MyCard(this.perfil);

  @override
  Widget build(BuildContext context) {
    var result;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4.0,
      // shadowColor:,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [Text('Nome: ${perfil.nome}')],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [Text('CPF: ${perfil.cpf}')],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [Text('Email: ${perfil.email}')],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [Text('Telefone: ${perfil.telefone}')],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onSelected: (result) {
                      if (result == 1) {
                        //arguments: passando o id do perfil para outra tela onde vou fazer um findById
                        Get.toNamed('/editarPerfil', arguments: [
                          perfil.id,
                          perfil.nome,
                          perfil.cpf,
                          perfil.email,
                          perfil.telefone
                        ]);
                      } else if (result == 2) {
                        // print('ola');
                        Get.defaultDialog(
                            title: 'Tem certeza?',
                            middleText:
                                'Você ira apagar o perfil de ${perfil.nome}',
                            radius: 10,
                            actions: [
                              FlatButton(
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.green,
                                onPressed: () {
                                  Get.back();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(width: 15),
                              RaisedButton(
                                child: Text(
                                  'Deletar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.red,
                                onPressed: () {
                                  RemoteServices().deletarPerfil(perfil.id);
                                  perfilController.refreshList(context);
                                  Get.back();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )
                            ]);
                      }
                    },
                    elevation: 5,
                    initialValue: 0,
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 3),
                                  child: Icon(Icons.edit),
                                ),
                                Text('Editar'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text('Deletar'),
                              ],
                            ),
                          )
                        ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
