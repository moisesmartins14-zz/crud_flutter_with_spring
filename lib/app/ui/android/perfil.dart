import 'package:crud/app/controller/perfilController.dart';
import 'package:crud/app/ui/android/perfilCardInfo.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PerfilController perfilController = Get.put(PerfilController());

// final BuildContext context;
// ignore: must_be_immutable
class PerfilPage extends StatelessWidget {
  GlobalKey<RefreshIndicatorState> refreshKey;

  Future<Null> refreshList(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    perfilController.perfilList.clear();
    perfilController.buscarPerfil();
    callApi();
    snackMsg(context);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfis'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      body: Column(
        children: [
          Expanded(
              child: RefreshIndicator(
            child: Stack(
              children: [
                Obx(
                  () {
                    if (perfilController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else
                      return callApi();
                  },
                ),
              ],
            ),
            onRefresh: () async {
              await refreshList(context);
              ;
            },
          ))
        ],
      ),
    );
  }

  void snackMsg(BuildContext context) {
    Flushbar(
      message: "Atualizado",
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(context);

    return null;
  }
}

//////WIDGET///////

Widget callApi() {
  //chama api e retorna cards com os dados
  return Obx(
    () {
      if (perfilController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
        return ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          itemCount: perfilController.perfilList.length,
          itemBuilder: (context, index) {
            return MyCard(perfilController.perfilList[index]);
          },
        );
    },
  );
}

Widget build(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;

  return Container(
    height: _screenSize.height * 0.2,
  );
}
