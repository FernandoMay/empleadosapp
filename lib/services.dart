import 'dart:convert';

import 'package:empleados/models.dart';
import 'package:http/http.dart' show Client;

const String baseUrl = "192.168.0.89:8080";
Client client = Client();

Future<List<Empleado>> getEmpleados() async {
  final response = await client.get(
    Uri.http(baseUrl, "/api/empleados"),
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    var data = Res.fromJson(body).data;
    return data;
  } else {
    throw Exception('Failed to load data from API ${response.statusCode}');
  }
}

Future<bool> createEmpleado(Empleado data) async {
  final response = await client.post(
      Uri.https(
        baseUrl,
        "/api/empleados",
        {"content-type": "application/json"},
      ),
      body: data.toJson());
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> updateEmpleado(Empleado data) async {
  final response = await client.put(
      Uri.https(
        baseUrl,
        "/api/empleados${data.id}",
        {"content-type": "application/json"},
      ),
      body: data.toJson());
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> deleteEmpleado(int id) async {
  final response = await client.delete(
    Uri.https(
      baseUrl,
      "/api/empleados$id",
      {"content-type": "application/json"},
    ),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
