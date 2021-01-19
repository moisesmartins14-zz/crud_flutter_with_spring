import 'dart:convert';

class perfilModel {
  int id;
  String nome;
  String cpf;
  String telefone;
  String email;

  perfilModel({this.id, this.nome, this.cpf, this.telefone, this.email});

  perfilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    telefone = json['telefone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cpf'] = this.cpf;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    return data;
  }
}
