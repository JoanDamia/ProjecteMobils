class Materials {
  String name;
  String image;
  String description;
  //String category;
  //String cooking_effect;
  //float hearts_recovered;

  int id;
  // List<dynamic> drops, location;

  Materials.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        id = json["id"],
        description = json["description"];
  //location = json["common_locations"],
  //category = json["category"],
  //cooking_effect = json["cooking_effect"],
  //hearts_recovered = json["hearts_recovered"],
  //properties = json["properties"];
}
