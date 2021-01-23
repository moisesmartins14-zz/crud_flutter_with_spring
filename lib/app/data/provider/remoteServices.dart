import 'dart:convert';

import 'package:crud/app/data/model/perfilModel.dart';
import 'package:crud/app/data/model/perfilModelo.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static var apiUrl = "http://192.168.43.34:8080/pessoa";

  // ignore: missing_return
  static Future<List<Perfil>> buscarPerfil() async {
    var response = await client.get(apiUrl);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);

      return perfilFromJson(jsonString);
    } else {
      throw Exception('A network error occurred');
      //show error message
    }
  }

  static Future<Perfil> buscarPerfilPeloId(int idPerfil) async {
    var response = await client.get('$apiUrl/$idPerfil');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('Dados 1: $jsonString');
      print('Dados 2: ${perfilFromJsonById(jsonString).toString()}');
      return perfilFromJsonById(jsonString);
    } else {
      throw Exception('A network error occurred');
      //show error message
    }
  }

  static Future<Perfil> updatePerfil(int id, Perfil perfil) async {
    Map dados = {
      "nome": perfil.nome,
      "cpf": perfil.cpf,
      "telefone": perfil.telefone,
      "email": perfil.email
    };

    final http.Response response = await client.put('$apiUrl/$id',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(dados));
    if (response.statusCode == 200) {
      return Perfil.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to update a case');
  }
}
