import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with SingleTickerProviderStateMixin {
  List<Enemy> enemies = [];
  late TransformationController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = TransformationController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _loadEnemiesData();
  }

  Future<void> _loadEnemiesData() async {
    try {
      String jsonString = await DefaultAssetBundle.of(context).loadString('enemies.json');
      dynamic decodedJson = json.decode(jsonString);
      enemies = [];

      if (decodedJson is Map<String, dynamic> && decodedJson.containsKey("monsters")) {
        List<dynamic> monstersList = decodedJson["monsters"];

        enemies = monstersList.map((json) => Enemy.fromJson(json)).toList();
      } else {
        print('El contenido del archivo JSON no tiene la propiedad "monsters".');
      }

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error al cargar y procesar el archivo JSON: $e');
    }
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
          tittleName: 'MAPA',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body: InteractiveViewer(
        key: UniqueKey(),
        constrained: false,
        minScale: 0.5,
        maxScale: 4.0,
        transformationController: _controller,
        child: Stack(
          children: [
            Image.asset('background.jpg', fit: BoxFit.cover),
            ...enemies.map((enemy) => Positioned(
              left: enemy.x * screenSize.width,
              top: enemy.y * screenSize.height,
              child: GestureDetector(
                onTap: () {
                  _scrollToEnemy(context, enemy);
                },
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(enemy.image),
                ),
              ),
            )).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEnemyListDialog(context);
        },
        child: const Icon(Icons.list),
      ),
    );
  }

  void _showEnemyListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Lista de Enemigos'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: enemies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(enemies[index].image),
                  ),
                  title: Text(enemies[index].name),
                  subtitle: Text(enemies[index].description),
                  onTap: () {
                    Navigator.pop(context); // Close the dialog
                    _scrollToEnemy(context, enemies[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _scrollToEnemy(BuildContext context, Enemy enemy) {
    final screenSize = MediaQuery.of(context).size;
    final double targetTranslateX = screenSize.width / 2 - enemy.x * screenSize.width;
    final double targetTranslateY = screenSize.height / 2 - enemy.y * screenSize.height;

    _animationController.reset();

    _animationController.addListener(() {
      _controller.value = Matrix4.identity()
        ..translate(targetTranslateX * _animationController.value,
            targetTranslateY * _animationController.value);
    });

    _animationController.forward();
  }
}

class Enemy {
  final String name;
  final String description;
  final String image;
  final double x;
  final double y;

  Enemy({
    required this.name,
    required this.description,
    required this.image,
    required this.x,
    required this.y,
  });

  factory Enemy.fromJson(Map<String, dynamic> json) {
    return Enemy(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      x: json['x'] != null ? (json['x'] as num).toDouble() : 0.0,
      y: json['y'] != null ? (json['y'] as num).toDouble() : 0.0,
    );
  }
}

