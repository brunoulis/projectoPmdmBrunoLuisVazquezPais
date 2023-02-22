import 'dart:convert';

import 'package:projectodart/modelos/cliente.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<Client>> listaClients() async {
  
  final response = await http.get(Uri.parse('http://localhost:4002/api/clientes'));

  return compute(decodeJson, response.body);

}

List<Client> decodeJson(String responseBody) {
  //Aqui convertimos el body de la respuesta a un json
  final myJson = jsonDecode(responseBody);
  //Aqui convertimos el json a un objeto de tipo Client
  return myJson['clientes']
      .map<Client>((item) => Client.fromJson(item))
      .toList();
}