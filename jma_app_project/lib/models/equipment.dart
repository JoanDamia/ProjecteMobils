class Equipment {
  String name;
  String image;
  //String description;
  //String category;
  //Properties;
  
  int id;
  // List<dynamic> drops, location;

  Equipment.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        id = json["id"];
  //description = json["description"],
  //location = json["common_locations"],
  //category = json["category"],
  //properties = json["properties"];
}