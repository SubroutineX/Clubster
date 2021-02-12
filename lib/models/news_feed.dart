// To parse this JSON data, do
//
//     final newsFeed = newsFeedFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<NewsFeed> newsFeedFromJson(String str) =>
    List<NewsFeed>.from(json.decode(str).map((x) => NewsFeed.fromJson(x)));

String newsFeedToJson(List<NewsFeed> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsFeed extends GetxController {
  NewsFeed({
    this.id,
    this.fileName,
    this.caption,
    this.user,
    this.college,
    this.timeStamp,
  });

  String id;
  String fileName;
  String caption;
  String user;
  String college;
  String timeStamp;

  factory NewsFeed.fromJson(Map<String, dynamic> json) => NewsFeed(
        id: json["_id"],
        fileName: json["fileName"],
        caption: json["caption"],
        user: json["user"],
        college: json["college"],
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fileName": fileName,
        "caption": caption,
        "user": user,
        "college": college,
        "timeStamp": timeStamp,
      };
}
