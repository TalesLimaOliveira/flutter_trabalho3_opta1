class TipsModel {
  int id;
  String title;
  String description;
  String type;

  TipsModel({
    this.id = -1,
    required this.title,
    required this.description,
    required this.type,
  });


  TipsModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'],
        type = map['type'];

  Map <String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    return data;
  }

  factory TipsModel.fromJson(Map<String, dynamic> json){
    return TipsModel(
      id: json['id'] as int,
      title: json['tile'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
    );
  } 

  Map <String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    return data;
  }

  String toSubtitle() {
    return "    $description";
  }
}
