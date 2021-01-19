import 'package:crud/app/routes/app_routes.dart';
import 'package:crud/app/ui/android/editPerfilPage.dart';
import 'package:crud/app/ui/android/home.dart';
import 'package:crud/app/ui/android/perfil.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.PERFIL, page: () => PerfilPage()),
    GetPage(name: Routes.EDITARPERFIL, page: () => EditarPerfil())
  ];
}
