import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:jma_app_project/widgets/home_widgets/arrow_divider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
          tittleName: 'REGISTRATION     ',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body: const GenerateHorsesWidget(),
    );
  }
}

class HorseData {
  String name;
  String image;
  int strength;
  double speed;
  int stamina;

  HorseData(
      {required this.name,
      required this.image,
      required this.strength,
      required this.speed,
      required this.stamina});

  HorseData.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        strength = json['strength'],
        speed = json['speed'],
        stamina = json['stamina'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'strength': strength,
      'speed': speed,
      'stamina': stamina
    };
  }

  int strengthStars() {
    if (strength < 110) {
      return 1;
    } else if (strength < 160) {
      return 2;
    } else if (strength < 220) {
      return 3;
    } else if (strength < 300) {
      return 4;
    } else {
      return 5;
    }
  }

  int speedStars() {
    if (speed < 10.5) {
      return 2;
    } else if (speed < 13) {
      return 3;
    } else if (strength < 14) {
      return 4;
    } else {
      return 5;
    }
  }
}

class GenerateHorsesWidget extends StatefulWidget {
  const GenerateHorsesWidget({super.key});

  @override
  GenerateHorsesWidgetState createState() => GenerateHorsesWidgetState();
}

class GenerateHorsesWidgetState extends State<GenerateHorsesWidget> {
  /// WIDGET STATE ///
  List<HorseData>? savedHorses;
  late HorseData currentHorse;

  /// HORSE STAT VALUES ///
  final Random random = Random();

  static const List<int> _strengthChoices = [
    80,
    110,
    130,
    150,
    160,
    220,
    240,
    250,
    300
  ];
  static const List<double> _speedChoices = [9.8, 10.5, 13, 14];
  static const List<int> _staminaChoices = [1, 2, 3, 4, 5];
  static const List<String> _horseIds = [
    "horse",
    "giant horse",
    "white horse",
    "stalhorse"
  ];

  /// UI ///

  @override
  void initState() {
    super.initState();

    _generateRandomData();
    _loadData();
  }

  void _generateRandomData() {
    final strength = _strengthChoices[random.nextInt(_strengthChoices.length)];
    final speed = _speedChoices[random.nextInt(_speedChoices.length)];
    final stamina = _staminaChoices[random.nextInt(_staminaChoices.length)];
    final horse = _horseIds[random.nextInt(_horseIds.length)];
    final image =
        "https://botw-compendium.herokuapp.com/api/v3/compendium/entry/$horse/image";

    setState(() {
      currentHorse = HorseData(
          name: horse,
          image: image,
          strength: strength,
          speed: speed,
          stamina: stamina);
    });
  }

  void _registerData(BuildContext context) async {
    // show input dialog
    String? userInput = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          TextEditingController controller = TextEditingController();
          return AlertDialog(
            title: const Text('Enter Horse Name'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Horse"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    Navigator.of(context).pop(controller.text);
                  }
                },
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });

    // if name is valid
    if (userInput != null && userInput.isNotEmpty) {
      currentHorse.name = userInput;

      // update list
      savedHorses ??= [];
      setState(() {
        savedHorses!.add(currentHorse);
      });

      // save data
      _saveData();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (savedHorses == null) {
      // loading

      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final data = savedHorses!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedButton(
                  title: "Generate New", onPressCallback: _generateRandomData),
              RoundedButton(
                  title: "Register",
                  onPressCallback: () => _registerData(context)),
            ],
          ),
          ShowGeneratedData(data: currentHorse),
          const SizedBox(height: 10), // separation
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: ArrowDivider(dividerTitle: "Saved Horses"))
            ],
          ),
          const SizedBox(height: 10), // separation
          Expanded(
              child: ShowDataList(
            data: data,
          )),
          const SizedBox(height: 10), // separation
        ],
      ),
    );
  }

  /// MANAGE RAW DATA ///

  Future<File> _getDataFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/generated_list.json');
    return file;
  }

  Future<void> _loadData() async {
    final file = await _getDataFile();

    if (await file.exists()) {
      final data = await file.readAsString();
      List<HorseData> horses = [];
      for (final raw in jsonDecode(data)) {
        horses.add(HorseData.fromJson(raw));
      }
      setState(() {
        savedHorses = horses;
      });
    } else {
      setState(() {
        savedHorses = [];
      });
    }
  }

  Future<void> _saveData() async {
    if (savedHorses != null && savedHorses!.isNotEmpty) {
      final file = await _getDataFile();
      await file.writeAsString(jsonEncode(savedHorses));
    }
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key, required this.title, required this.onPressCallback});

  final String title;
  final VoidCallback onPressCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          onPressCallback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 230, 183, 97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 16.0, color: Colors.white, fontFamily: 'Zelda'),
          ),
        ),
      ),
    );
  }
}

class ShowGeneratedData extends StatelessWidget {
  final HorseData data;

  const ShowGeneratedData({super.key, required this.data});

  Widget _buildStat(int numStars, String name, BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(children: [
      Container(
        margin: const EdgeInsets.all(5),
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'Zelda',
            color: Colors.white,
            fontSize: screenSize.width / 30,
          ),
        ),
      ),
      Row(
        children: List.generate(
          numStars,
          (index) => const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(6, 3, 6, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/black.jpg'), fit: BoxFit.cover),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Color.fromARGB(100, 0, 0, 0),
            )
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 199, 162, 95),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            height: screenSize.height / 8,
            child: Image(
              image: NetworkImage(data.image),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  data.name,
                  style: TextStyle(
                    fontFamily: 'Zelda',
                    color: const Color.fromARGB(255, 199, 162, 95),
                    fontSize: screenSize.width / 20,
                  ),
                ),
              ),
              _buildStat(data.strengthStars(), "Strength", context),
              _buildStat(data.speedStars(), "Speed", context),
              _buildStat(data.stamina, "Stamina", context)
            ],
          )
        ],
      ),
    );
  }
}

class ShowListElement extends StatelessWidget {
  const ShowListElement({
    super.key,
    required this.data,
  });

  final HorseData data;

  Widget _buildStat(int numStars, String name, BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(children: [
      Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'Zelda',
            color: const Color.fromARGB(255, 77, 169, 255),
            fontSize: screenSize.width / 30,
          ),
        ),
      ),
      Row(
        children: List.generate(
          numStars,
          (index) => const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(6, 3, 6, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/white.jpg'), fit: BoxFit.cover),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Color.fromARGB(100, 0, 0, 0),
            )
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 199, 162, 95),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            height: screenSize.height / 10,
            child: Image(
              image: NetworkImage(data.image),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  data.name,
                  style: TextStyle(
                    fontFamily: 'Zelda',
                    color: const Color.fromARGB(255, 199, 162, 95),
                    fontSize: screenSize.width / 20,
                  ),
                ),
              ),
              _buildStat(data.strengthStars(), "Strength", context),
              _buildStat(data.speedStars(), "Speed", context),
              _buildStat(data.stamina, "Stamina", context)
            ],
          )
        ],
      ),
    );
  }
}

class ShowHorseElement extends StatelessWidget {
  const ShowHorseElement({
    super.key,
    required this.data,
  });

  final HorseData data;

  Widget _buildStat(int numStars, String name, BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(children: [
      Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'Zelda',
            color: const Color.fromARGB(255, 77, 169, 255),
            fontSize: screenSize.width / 30,
          ),
        ),
      ),
      Row(
        children: List.generate(
          numStars,
          (index) => const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(6, 3, 6, 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/white.jpg'), fit: BoxFit.cover),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Color.fromARGB(100, 0, 0, 0),
            )
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 199, 162, 95),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            height: screenSize.height / 10,
            child: Image(
              image: NetworkImage(data.image),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  data.name,
                  style: TextStyle(
                    fontFamily: 'Zelda',
                    color: const Color.fromARGB(255, 199, 162, 95),
                    fontSize: screenSize.width / 20,
                  ),
                ),
              ),
              _buildStat(data.strengthStars(), "Strength", context),
              _buildStat(data.speedStars(), "Speed", context),
              _buildStat(data.stamina, "Stamina", context)
            ],
          )
        ],
      ),
    );
  }
}

class ShowDataList extends StatelessWidget {
  final List<HorseData> data;

  const ShowDataList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ShowListElement(data: data[index]);
      },
    );
  }
}
