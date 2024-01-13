import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class HorseApi {
  Future<List<Map<String, dynamic>>> loadHorses() async {
    try {
      final jsonString = await rootBundle.loadString('data/horses.json');
      final jsonData = jsonDecode(jsonString)["data"];
      return List<Map<String, dynamic>>.from(jsonData);
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}

Future<Map<String, dynamic>> readJsonFile(String fileName) async {
  String jsonString = await rootBundle.loadString(fileName);
  return json.decode(jsonString);
}

Future<void> writeJsonFile(String fileName, Map<String, dynamic> jsonData) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(json.encode(jsonData));
  } catch (e) {
    print('Error: $e');
  }
}