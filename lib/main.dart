import 'package:crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(GetMaterialApp(
    title: "crud",
    debugShowCheckedModeBanner: false,
    getPages: AppPages.routes,
    initialRoute: '/home',
  ));
}
