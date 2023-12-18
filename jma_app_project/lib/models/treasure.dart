class Treasure {
  String name;
  String image;
  String description;
  //String category;
  int id;
  // List<dynamic> drops, location;

  Treasure.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        //drops = json["drops"],
        id = json["id"],
        description = json["description"];
  //location = json["common_locations"],
  //category = json["category"];
}
