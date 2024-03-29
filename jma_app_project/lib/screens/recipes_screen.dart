import 'package:flutter/material.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';
import 'package:jma_app_project/widgets/recipes_widgets/recipes_tab_bar.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

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
          tittleName: 'RECIPES     ',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body:Container(
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
        child: Column(
          children: [
            SizedBox(        
              height: screenSize.height / 1.5,
              child: const RecipesTabBar(),
            ),
        
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenSize.width / 20 ,screenSize.height / 15),
                    shape:const BeveledRectangleBorder(),
                    padding: const EdgeInsets.all(20), 
                    backgroundColor: const Color.fromARGB(255, 46, 45, 45),
                    foregroundColor: const Color.fromARGB(255, 255, 225, 127),
                    shadowColor: Colors.black, 
                  ),
              onPressed: (){}, 
              child:  Text(
                "Make Recipe",
                style: TextStyle(fontSize: screenSize.width / 20,
                fontFamily: 'Zelda'),
                ),
              )
          ],
        ),
      ),
    );
  }
}
