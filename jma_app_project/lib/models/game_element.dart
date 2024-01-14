class GameElement {
  int id;
  String name;
  String image;
  String description;
  List<dynamic>? locations;

  GameElement.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        id = json["id"],
        description = json["description"],
        locations = json["common_locations"]
  ;
}
