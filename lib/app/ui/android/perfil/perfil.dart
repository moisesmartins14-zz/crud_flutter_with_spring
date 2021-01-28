import 'package:crud/app/controller/perfilController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PerfilController perfilController = Get.put(PerfilController());

// final BuildContext context;
// ignore: must_be_immutable
class PerfilPage extends StatelessWidget {
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

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
                          return perfilController.callApi();
                      },
                    ),
                  ],
                ),
                onRefresh: () async {
                  await perfilController.refreshList(context);
                  ;
                },
              ))
        ],
      ),
    );
  }
}
//////WIDGET///////

// Widget build(BuildContext context) {
//   final _screenSize = MediaQuery.of(context).size;
//
//   return Container(
//     height: _screenSize.height * 0.2,
//   );
// }
