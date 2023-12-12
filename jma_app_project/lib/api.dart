import 'dart:convert';

import 'package:jma_app_project/models/treasure.dart';
import 'package:http/http.dart' as http;

Future<List<Treasure>> apiLoadUsers() async {
  final uri =
      Uri.parse("https://botw-compendium.herokuapp.com/api/v3/compendium/all");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonTreasureList = json["data"];
  final List<Treasure> treasureList = [];
  for (final jsonTreasure in jsonTreasureList) {
    final user = Treasure.fromJson(jsonTreasure);
    treasureList.add(user);
  }
  return treasureList;
}
