import 'dart:convert';

import 'package:jma_app_project/models/treasure.dart';
import 'package:http/http.dart' as http;

Future<List<Treasure>> apiLoadUsers() async {
  final uri =
      Uri.parse("https://botw-compendium.herokuapp.com/api/v3/compendium/all");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonUserList = json["data"];
  final List<Treasure> userList = [];
  for (final jsonUser in jsonUserList) {
    final user = Treasure.fromJson(jsonUser);
    userList.add(user);
  }
  return userList;
}
