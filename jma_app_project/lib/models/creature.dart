class Creature {
  String name;
  String image;
  String description;
  //String category;
  //bool edible;
  int id;
  // List<dynamic> drops, location;

  Creature.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        //drops = json["drops"],
        id = json["id"],
        description = json["description"];
  //location = json["common_locations"],
  //edible = json["edible"],
  //category = json["category"];
}
