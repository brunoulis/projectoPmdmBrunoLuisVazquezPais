import 'dart:convert';
import 'dart:html';

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
  return myJson['clientes'].map<Client>((json) => Client.fromJson(json)).toList();
}
mapClient(Client client, bool mapId){
  Map data;
  // Si vamos a guardar no enviamos el id en el objeto por que es automatico
  if(!mapId){
    data ={
      'nombre': client.nombre,
      'problema': client.problema,
      'descripcion': client.descripcion,
      'fecha': client.fecha,
      'estado': client.estado,
      'telefono': client.telefono
    };
    // Si vamos a actualizar enviamos el objeto cliente con su id
  }else{
    data ={
      'id': client.id,
      'nombre': client.nombre,
      'problema': client.problema,
      'descripcion': client.descripcion,
      'fecha': client.fecha,
      'estado': client.estado,
      'telefono': client.telefono
    };
  }
}

Future<Client> addClient(Client client) async {
  var url = Uri.parse('http://localhost:4002/api/clientes/add');
  var _body =json.encode(mapClient(client, false));

  var response = await http.post(url, 
    headers: {"Content-Type": "application/json; charset=UTF-8"}, body: _body);

  if(response.statusCode == 200){
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  }else{
    throw Exception('Error al intentar añadir un cliente');
  }
}