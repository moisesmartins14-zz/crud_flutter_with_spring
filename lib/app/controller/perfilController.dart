import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/provider/remoteServices.dart';
import 'package:crud/app/ui/android/perfil/perfil.dart';
import 'package:crud/app/ui/android/perfil/perfilCardInfo.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PerfilController extends GetxController {
  var isLoading = true.obs;
  var perfilList = List<Perfil>().obs;
  BuildContext context;
  @override
  void onInit() {
    // TODO: implement onInit
    buscarPerfil();
    super.onInit();
  }

  void buscarPerfil() async {
    try {
      isLoading(true);
      // print('exibir perfil');
      var perfil = await RemoteServices.buscarPerfil();
      if (perfil != null) {
        // ignore: deprecated_member_use, invalid_use_of_protected_member
        perfilList.value = perfil;
      }
    } finally {
      // print('carregando');
      isLoading(false);
    }
  }

  Future<Null> refreshList(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    perfilList.clear();
    buscarPerfil();
    callApi();
    snackMsg(context);
    return null;
  }

  Widget callApi() {
    //chama api e retorna cards com os dados
    return Obx(
      () {
        if (isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            itemCount: perfilList.length,
            itemBuilder: (context, index) {
              return MyCard(perfilList[index]);
            },
          );
      },
    );
  }

  Widget snackMsg(BuildContext context) {
    Flushbar(
      message: "Atualizado",
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(context);

    return null;
  }
}
