class GameElement {
  int id;
  String name;
  String image;
  String description;

  GameElement.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        image = json["image"],
        id = json["id"],
        description = json["description"];

  bool matchesSearch(String search) {
    if (name.contains(search)) return true;
    if (description.contains(search)) return true;
    return false;
  }
}
