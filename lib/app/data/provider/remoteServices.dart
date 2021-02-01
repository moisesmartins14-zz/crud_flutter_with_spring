import 'dart:convert';
import 'package:crud/app/data/model/perfilModel.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static var apiUrl = "http://192.168.0.108:8080/pessoa";

  // ignore: missing_return
  static Future<List<Perfil>> buscarPerfil() async {
    var response = await client.get(apiUrl);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // print(jsonString);
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
      // print('Dados 1: $jsonString');
      return perfilFromJsonById(jsonString);
    } else {
      throw Exception('A network error occurred');
      //show error message
    }
  }

  static Future<Perfil> updatePerfil(int id, Perfil perfil) async {
    Map data = {
      // "id": perfil.id,
      "nome": perfil.nome.toString(),
      "cpf": perfil.cpf.toString(),
      "email": perfil.email.toString(),
      "telefone": perfil.telefone.toString()
    };
    var body = jsonEncode(data);
    final response = await client.put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Charset': 'utf-8'
      },
      body: body,
    );
    // print(response.statusCode);
    // print('id: ${perfil.id}');
    // print(data);
    if (response.statusCode == 200) {
      return Perfil.fromJson(jsonDecode(response.body));
    } else
      throw Exception('Failed to update a case');
  }

  static Future<Perfil> criarPerfil(Perfil perfil) async {
    Map data = {
      "nome": perfil.nome.toString(),
      "cpf": perfil.cpf.toString(),
      "email": perfil.email.toString(),
      "telefone": perfil.telefone.toString()
    };
    var body = jsonEncode(data);
    final response = await client.post(
      '$apiUrl',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Charset': 'utf-8'
      },
      body: body,
    );
    // print(response.statusCode);
    // print(data);
    if (response.statusCode == 200) {
      return Perfil.fromJson(jsonDecode(response.body));
    } else
      throw Exception('Failed to update a case');
  }

  Future<Perfil> deletePerfil(int idPerfil) async {
    final response = await client.delete('$apiUrl/$idPerfil',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
        });
    if (response.statusCode == 200) {
      return Perfil.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to delete Perfil');
    }
  }
}
