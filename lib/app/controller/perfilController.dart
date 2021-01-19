import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/provider/remoteServices.dart';
import 'package:get/state_manager.dart';

class PerfilController extends GetxController {
  var isLoading = true.obs;
  var perfilList = List<Perfil>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    buscarPerfil();
  }

  void buscarPerfil() async {
    try {
      isLoading(true);
      var perfil = await RemoteServices.buscarPerfil();
      if (perfil != null) {
        // ignore: deprecated_member_use, invalid_use_of_protected_member
        perfilList.value = perfil;

        // ignore: invalid_use_of_protected_member
      }
    } finally {
      isLoading(false);
    }
  }


}
