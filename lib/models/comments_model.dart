// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

List<Comment> commentsFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentsToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  Comment({
    this.id,
    this.text,
    this.user,
    this.timeStamp,
  });

  String id;
  String text;
  String user;
  String timeStamp;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
      id: json["_id"],
      text: json["text"],
      user: json["user"],
      timeStamp: json["timeStamp"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "user": user,
        "timeStamp": timeStamp,
      };
}
