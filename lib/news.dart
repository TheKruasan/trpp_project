import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  int id;
  String header;
  String content;
  List<Group> groups;
  String imageUrl;
  int course;

  News({
    required this.id,
    required this.header,
    required this.content,
    required this.groups,
    required this.imageUrl,
    required this.course,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        header: json["header"],
        content: json["content"],
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        imageUrl: json["imageUrl"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header,
        "content": content,
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
        "imageUrl": imageUrl,
        "course": course,
      };
}

class Group {
  String groupNumber;
  int course;

  Group({
    required this.groupNumber,
    required this.course,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupNumber: json["groupNumber"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "groupNumber": groupNumber,
        "course": course,
      };
}
