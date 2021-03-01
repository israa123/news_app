//Creat the Source Model Class
class Source {
  String id;
  String name;
  //Create the Constructor
  Source({this.id, this.name});
  //Create the factory function to map the json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
