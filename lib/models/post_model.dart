// To parse this JSON data, do
//
//     final Post = newsFeedFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<Post> postsFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postsToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post extends GetxController {
  Post({
    this.id,
    this.fileName,
    this.caption,
    this.user,
    this.college,
    this.timeStamp,
    this.likes,
    this.comments,
  });

  String id;
  String fileName;
  String caption;
  String user;
  String college;
  String timeStamp;
  int likes;
  int comments;

  final bookmark = false.obs;
  final like = false.obs;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        fileName: json["fileName"],
        caption: json["caption"],
        user: json["user"],
        college: json["college"],
        timeStamp: json["timeStamp"],
        likes: json["likes"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fileName": fileName,
        "caption": caption,
        "user": user,
        "college": college,
        "timeStamp": timeStamp,
        "likes": likes,
        "comments": comments,
      };
}
