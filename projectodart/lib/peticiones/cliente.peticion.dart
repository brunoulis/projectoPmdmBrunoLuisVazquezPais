import 'dart:convert';

import 'package:projectodart/modelos/cliente.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<Client>> listaClientes() async {
  
  final response = 
    await http.get(Uri.parse('http://localhost:4002/api/clientes'));

  return compute(decodeJson, response.body);

}

List<Client> decodeJson(String responseBody) {
  //Aqui convertimos el body de la respuesta a un json
  final myJson = json.decode(responseBody);
  //Aqui convertimos el json a un objeto de tipo Client
  return myJson.map<Client>((json) => Client.fromJson(json)).toList();
}