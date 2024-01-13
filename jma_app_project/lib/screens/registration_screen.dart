import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../api_routes/horse_api.dart';
import '../widgets/compendium_widgets/show_element_list.dart';
import '../widgets/general_widgets/home_button.dart';
import '../widgets/general_widgets/important_tittle.dart';

void main() {
  runApp(const MaterialApp(
    home: RegistrationScreen(),
  ));
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RegistrationScreenContent();
  }
}

class _RegistrationScreenContent extends StatefulWidget {
  const _RegistrationScreenContent({Key? key}) : super(key: key);

  @override
  __RegistrationScreenContentState createState() =>
      __RegistrationScreenContentState();
}

class __RegistrationScreenContentState
    extends State<_RegistrationScreenContent> {
  List<int> selectedStats = List.generate(4, (index) => -1);
  String horseName = '';
  Uint8List? imageData;
  String? imageName;
  late Map<String, dynamic> jsonData;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      final jsonString =
      await html.HttpRequest.getString('data/horses.json');
      jsonData = json.decode(jsonString);
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      Uint8List bytes = result.files.first.bytes!;
      String name = result.files.first.name ?? 'Unknown';
      setState(() {
        imageData = bytes;
        imageName = name;
      });
    }
  }

  Image? getImageWidget() {
    if (imageData != null) {
      return Image.memory(imageData!);
    } else {
      return null;
    }
  }

  Map<String, dynamic> getFormData() {
    return {
      "category": "Horse",
      "description": "Is this a horse",
      "stat4": selectedStats[3] + 1,
      "stat3": selectedStats[2] + 1,
      "stat2": selectedStats[1] + 1,
      "stat1": selectedStats[0] + 1,
      "id": 3,
      "image": "data/${imageName ?? ''}",
      "name": horseName,
    };
  }

  String getStatName(int index) {
    switch (index) {
      case 0:
        return 'Fuerza      ';
      case 1:
        return 'Velocidad   ';
      case 2:
        return 'Resistencia';
      case 3:
        return '         ';
      default:
        return '';
    }
  }

  Future<void> _updateJsonData() async {
    Map<String, dynamic> nuevoElemento = getFormData();

    jsonData['data'] ??= [];
    jsonData['data'].add(nuevoElemento);

    print('Data update: $nuevoElemento');

    html.window.localStorage['horses_data'] = json.encode(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 255, 225, 127),
        elevation: 3,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: ImportantTittle(
          screenSize: screenSize,
          tittleName: 'Registration     ',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> formData = getFormData();
                  print('Form Data: $formData');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                child: const Text(
                  'GENERATE NEW',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Table(
                  columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(3)},
                  children: [
                    TableRow(
                      children: [
                        GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            height: 100,
                            width: 100,
                            child: getImageWidget(),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        for (int j = 0; j < 4; j++)
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedStats[i] = j;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(15),
                                              width: 35,
                                              height: 35,
                                              child: ClipPath(
                                                clipper: TriangleClipper(),
                                                child: Container(
                                                  color: selectedStats[i] == j
                                                      ? Colors.green
                                                      : Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        Text(getStatName(i)),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  setState(() {
                    horseName = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Nombre del Caballo'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> formData = getFormData();
                  print('From Data: $formData');

                  final existingData = await readJsonFile('data/horses.json');
                  print('Existing data: $existingData');

                  String jsonFileName = 'data/horses.json';

                  Map<String, dynamic> jsonData = await readJsonFile(jsonFileName);

                  Map<String, dynamic> nuevoElemento = {
                    "category": "Horse",
                    "description": "Is this a horse",
                    "stat4": selectedStats[3] + 1,
                    "stat3": selectedStats[2] + 1,
                    "stat2": selectedStats[1] + 1,
                    "stat1": selectedStats[0] + 1,
                    "id": 3,
                    "image": "https://acortar.link/Htk6RW",
                    "name": horseName
                  };

                  jsonData['data'] ??= [];
                  jsonData['data'].add(nuevoElemento);

                  print('data actualizada: $nuevoElemento');

                  await writeJsonFile(jsonFileName, jsonData);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 28, 26),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: const BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                child: const Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: screenSize.height * 0.5,
                child: const ShowHorseList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
