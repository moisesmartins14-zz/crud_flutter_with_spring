import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/provider/remoteServices.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditPerfilController extends GetxController {
  Perfil perfil;
  var isLoading = true.obs;
  var perfilEdit = Perfil().obs;


  EditPerfilController({this.perfil});

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  void onInit() {
    var idPerfil = Get.arguments;
    buscarPerfilPeloId(idPerfil);
    // print(idPerfil);

    // print(' nome: ${Perfil.fromJson()}');
    // cpfController.text = perfil.cpf;
    // emailController.text =perfil.email;
    // telefoneController.text = perfil.telefone;
    // TODO: implement onInit
    super.onInit();

  }

  void buscarPerfilPeloId(int idPerfil) async {
    try {
      isLoading(true);
      var perfil = await RemoteServices.buscarPerfilPeloId(idPerfil);
      if (perfil != null) {
        perfilEdit.value = perfil;
      }
    } finally {
      isLoading(false);
    }
  }

  var cpfMaskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var telefoneMaskFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
}
