import 'dart:ffi';
import 'dart:io';
import 'dart:convert'; // Per realitzar conversions entre tipus de dades
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Per realitzar peticions HTTP

Future<List<dynamic>> obtInfoTrabajos(String ciudad) async{
  String url = 'https://node-trabajos-rest-server-production.up.railway.app/api/trabajos/$ciudad';

  // Lanzamos la petición GET mediante el método http.get, y esperamos a la respuesta
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    String body = utf8.decode(response.bodyBytes);
    final result = jsonDecode(body);

    debugPrint(result.runtimeType.toString());
    return result;
  } else {
    // Si no carga, lanzamos una excepción
    throw Exception('No se ha podido conectar');
  }
}

Future<dynamic> obtInfoTrabajo(String trabajo) async{
  String url = 'https://node-trabajos-rest-server-production.up.railway.app/api/infotrabajo/$trabajo';

  // Lanzamos la petición GET mediante el método http.get, y esperamos a la respuesta
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    var result = jsonDecode(response.body);

    debugPrint(result.runtimeType.toString());
    return result;
  } else {
    // Si no carga, lanzamos una excepción
    throw Exception('No se ha podido conectar');
  }
}

Future<dynamic> obtDireccion({required String calle, required double piso,required double numero }) async{

  String url='https://api.open-meteo.com/v1/forecast?calle=$calle&numero=$numero&piso=$piso';
  // Llancem una petició GET mitjançant el mètode http.get, i ens esperem a la resposta
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == HttpStatus.ok) {
    // var result = jsonDecode(response.body);

    String body = utf8.decode(response.bodyBytes);
    final result = jsonDecode(body);

    debugPrint(result.runtimeType.toString());
    return result;
  } else {
    // Si no carrega, llancem una excepció
    throw Exception('No s\'ha pogut connectar');
  }
}