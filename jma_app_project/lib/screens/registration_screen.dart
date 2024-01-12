import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';
import 'package:jma_app_project/widgets/register_widgets/generate_new_button.dart';
import 'package:jma_app_project/widgets/register_widgets/horse_image.dart';
import 'package:jma_app_project/widgets/register_widgets/register_button.dart';
import 'package:jma_app_project/widgets/register_widgets/stats.dart';

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
  // Variables para almacenar estadísticas seleccionadas y nombres de caballos
  List<int> selectedStats = List.generate(4, (index) => -1); // -1 representa ninguna selección
  String horseName = '';

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
        padding: const EdgeInsets.all(30.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'REGISTRATION',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const GenerateNewButton(),
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
                    const TableRow(
                      children: [
                        HorseImage(),
                      ],
                    ),
                    TableRow(
                      children: [

                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  for (int i = 0; i < 4; i++)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (int j = 0; j < 4; j++)
                                          GestureDetector(
                                            onTap: () {
                                              
                                              setState(() {
                                                selectedStats[i] = j;
                                              });
                                            },
                                            child: Stats(selectedStats: selectedStats, i: i, j: j),
                                          ),
                                        const Text('Stats'),
                                        
                                      ],
                                    ),
                                ],
                              ),
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
                decoration: const InputDecoration(labelText: 'Horse Name'),
              ),
              const SizedBox(height: 16),

              const RegisterButton(),
              const SizedBox(height: 16),
  
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

void main() {
  runApp(const MaterialApp(
    home: RegistrationScreen(),
  ));
}
