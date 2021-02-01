import 'package:crud/app/controller/perfilController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final PerfilController perfilController = Get.put(PerfilController());

class PerfilPage extends StatelessWidget {
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              color: Colors.white,
              onPressed: () {
                Get.toNamed('addPerfil');
              })
        ],
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
