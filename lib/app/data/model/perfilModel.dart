import 'dart:convert';

List<Perfil> perfilFromJson(String str) => List<Perfil>.from(json.decode(str).map((x) => Perfil.fromJson(x)));

String perfilToJson(List<Perfil> data) => json.encode(List<String>.from(data.map((x) => x.toJson())));

Perfil perfilFromJsonById(String str) => Perfil.fromJson(json.decode(str));

String perfilToJsonById(Perfil data) => json.encode(data.toJson());

class Perfil {
  Perfil({
    this.id,
    this.nome,
    this.cpf,
    this.telefone,
    this.email,
  });

  int id;
  String nome;
  String cpf;
  String telefone;
  String email;

  factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
    id: json["id"],
    nome: json["nome"],
    cpf: json["cpf"],
    telefone: json["telefone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "cpf": cpf,
    "telefone": telefone,
    "email": email,
  };
}