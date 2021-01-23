import 'package:crud/app/routes/app_routes.dart';
import 'file:///C:/Users/moisesmartins/Desktop/GitHub/android/crud_flutter_with_spring/lib/app/ui/android/perfil/editPerfilPage.dart';
import 'package:crud/app/ui/android/home.dart';
import 'file:///C:/Users/moisesmartins/Desktop/GitHub/android/crud_flutter_with_spring/lib/app/ui/android/perfil/perfil.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.PERFIL, page: () => PerfilPage()),
    GetPage(name: Routes.EDITARPERFIL, page: () => EditarPerfil())
  ];
}
