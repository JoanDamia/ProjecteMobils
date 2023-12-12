class Treasure {
  String name;
  String image;
  List<String> drops;
  int id;
  String description;
  String location;
  String category;

  Treasure.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        drops = json["drops"],
        id = json["id"],
        description = json["description"],
        location = json["common_locations"],
        category = json["category"];
}
