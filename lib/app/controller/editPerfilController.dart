import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/model/perfilModelo.dart';
import 'package:crud/app/data/provider/remoteServices.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditPerfilController extends GetxController {
  Perfil perfil;
  var isLoading = true.obs;
  var perfilEdit = Perfil().obs;

  EditPerfilController({this.perfil});

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  void onInit() {
    // recuperando o id da tela anterior e passando como parametro para funçao
    var idPerfil = Get.arguments;
    buscarPerfilPeloId(idPerfil);
    // TODO: implement onInit
    super.onInit();
  }

  void buscarPerfilPeloId(int idPerfil) async {
    try {
      isLoading(true);
      var dadosByid = await RemoteServices.buscarPerfilPeloId(idPerfil);
      if (dadosByid != null) {
        perfilEdit.value = dadosByid;
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
