import 'package:jma_app_project/models/creature.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Creature>> apiLoadMonsters() async {
  final uri = Uri.parse(
      "https://botw-compendium.herokuapp.com/api/v3/compendium/category/creatures");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonMonsterList = json["data"];
  final List<Creature> monsterList = [];
  for (final jsonMonster in jsonMonsterList) {
    final monster = Creature.fromJson(jsonMonster);
    monsterList.add(monster);
  }
  return monsterList;
}