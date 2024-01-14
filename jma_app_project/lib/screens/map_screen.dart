import 'package:flutter/material.dart';
import 'package:flutter_image_map/flutter_image_map.dart';
import 'package:jma_app_project/api_routes/monster_api.dart';
import 'package:jma_app_project/models/monster.dart';
import 'package:jma_app_project/widgets/general_widgets/home_button.dart';
import 'package:jma_app_project/widgets/general_widgets/important_tittle.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

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
          tittleName: 'MAP     ',
        ),
        centerTitle: true,
        leading: const HomeButton(),
      ),
      body: const InteractiveMapWidget(),
    );
  }
}

class InteractiveMapWidget extends StatefulWidget {
  const InteractiveMapWidget({super.key});

  @override
  InteractiveMapWidgetState createState() => InteractiveMapWidgetState();
}

class InteractiveMapWidgetState extends State<InteractiveMapWidget> {
  List<Monster>? enemyList;
  List<String> currentMapLocations = [];
  int currentSelectedEnemy = -1;

  @override
  void initState() {
    super.initState();

    _loadEnemyList();
  }

  @override
  Widget build(BuildContext context) {
    if (enemyList == null) { // loading
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stack(
      children: [
        InteractiveViewer(
            constrained: false,
            child: ImageMapWidget(locations: currentMapLocations)
        ),
        EnemyListWidget(
            enemyList: enemyList!,
            onEnemySelected: _getEnemyMapLocations,
        ),
      ],
    );

  }

  /// DATA ///

  Future<void> _loadEnemyList() async {
    final monsters = await apiLoadMonsters();

    // update and filter not valid locations
    setState(() {
      enemyList = monsters.where((element) => element.locations != null && element.locations!.every((element) => element is String) && element.locations!.isNotEmpty).toList();
    });
  }

  void _getEnemyMapLocations(int index) {
    if (index == currentSelectedEnemy) { // remove locations
      currentSelectedEnemy = -1;
      setState(() {
        currentMapLocations = [];
      });
    }
    else {
      currentSelectedEnemy = index;
      setState(() {
        currentMapLocations = enemyList![index].locations!.cast<String>();
      });
    }
  }
}

class ImageMapWidget extends StatelessWidget {
  final List<String> locations;

  static const Map<String, Offset> allLocations = {
    'Eldin Mountains': Offset(451,87),
    'Tabantha Frontier': Offset(135,234),
    'Divine Beast Vah Ruta': Offset(600,279),
    'Eldin Canyon': Offset(493,215),
    'Divine Beast Vah Medoh': Offset(136,191),
    'Hebra Mountains': Offset(168,100),
    'Lanayru Great Spring': Offset(627,325),
    'Death Mountain': Offset(550,139),
    'Hyrule Ridge': Offset(217,292),
    'Hyrule Field': Offset(342,358),
    'East Necluda': Offset(553,489),
    'Divine Beast Vah Naboris': Offset(122,507),
    'Gerudo Desert': Offset(128,568),
    'Gerudo Highlands': Offset(98,379),
    'Lake Floria': Offset(496,549),
    'Hyrule Castle': Offset(362,272),
    'Yiga Clan Hideout': Offset(135,403),
    'Divine Beast Vah Rudania': Offset(489,152),
    'Akkala Highlands': Offset(616,168),
    'West Necluda': Offset(467,424),
    'Great Hyrule Forest': Offset(397,152),
    'Mount Lanayru': Offset(641,400),
    'Lake Hylia': Offset(363,475),
    'Deep Akkala': Offset(612,96),
  };

  const ImageMapWidget({super.key, required this.locations});

  ImageMapRegion _fromMapToImage(String location) {
    Offset position;
    if (allLocations.containsKey(location)) {
      position = allLocations[location]!;
    }
    else {
      position = const Offset(87, 191);
    }
    
    return ImageMapRegion.fromCircle(center: position, radius: 20, color: const Color.fromRGBO(255, 0, 0, 0.5),);
  }

  @override
  Widget build(BuildContext context) {
    return ImageMap(
        image: Image.asset('assets/zeldaMap.jpg'),
        onTap: (region) {

        },
        regions: List<ImageMapRegion>.generate(locations.length, (index) => _fromMapToImage(locations[index]))
    );
  }
}

class EnemyListWidget extends StatefulWidget {
  final List<Monster> enemyList;
  final Function(int) onEnemySelected;

  const EnemyListWidget({super.key, required this.enemyList, required this.onEnemySelected});

  @override
  EnemyListWidgetState createState() => EnemyListWidgetState();
}

class EnemyListWidgetState extends State<EnemyListWidget> {
  bool _expanded = false;

  Widget _collapsedBanner(Size screenSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ArrowDivider(
          dividerTitle: 'Enemy List',
        ),
        const Spacer(),
        IconButton(
          icon: Icon(_expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, color: Colors.white, size: screenSize.width / 10,),
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
        ),
      ],
    );
  }

  Widget _expandedView(Size screenSize) {
    return Column(
      children: [
        _collapsedBanner(screenSize),
        Expanded(
            child: ListView.builder(
              itemCount: widget.enemyList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    widget.onEnemySelected(index);
                    setState(() {
                      _expanded = false;
                    });
                  },
                  child: EnemyListItem(data: widget.enemyList[index]),
                );
              },
            )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: !_expanded ? screenSize.height * 0.1 : screenSize.height,
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/black.jpg'),
                repeat: ImageRepeat.repeat
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 10.0,
                color: Color.fromARGB(200, 0, 0, 0),
              ),
            ]
          ),
          child: _expanded ? _expandedView(screenSize) : _collapsedBanner(screenSize)
        )
    );
  }
}

class ArrowDivider extends StatelessWidget {
  const ArrowDivider({
    super.key,
    required this.dividerTitle,
  });

  final String dividerTitle;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dividerTitle,
          style: TextStyle(
            fontFamily: 'Zelda',
            fontSize: screenSize.width / 16,
            color: Colors.white
          ),
        ),
        Row(
          children: [
            Container(
                width: screenSize.width * 0.4,
                height: 3,
                color: const Color.fromARGB(255, 172, 147, 94)
            ),
            SizedBox(
              height: 5,
              child: Transform.flip(
                flipX: true,
                child: const Image(
                  image: AssetImage('assets/arrow_decoration_tip.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class EnemyListItem extends StatelessWidget {
  const EnemyListItem({
    super.key,
    required this.data,
  });

  final Monster data;

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
          ],

      ),
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
            ],
          )
        ],
      ),
    );
  }
}

