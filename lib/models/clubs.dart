// To parse this JSON data, do
//
//     final welcome = clubsFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Clubs> clubsFromJson(String str) =>
    List<Clubs>.from(json.decode(str).map((x) => Clubs.fromJson(x)));

String clubsToJson(List<Clubs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clubs extends GetxController {
  Clubs({
    this.id,
    this.clubName,
    this.genre,
    this.description,
    this.status,
    this.memberLimit,
    this.elite,
  });

  String id;
  String clubName;
  String genre;
  String description;
  String status;
  int memberLimit;
  String elite;

  final following = false.obs;
  final members = 0.obs;
  final followers = 0.obs;
  final bookmark = false.obs;
  final like = false.obs;

  factory Clubs.fromJson(Map<String, dynamic> json) => Clubs(
        id: json["_id"],
        clubName: json["clubName"],
        genre: json["genre"],
        description: json["description"],
        status: json["status"],
        memberLimit: json["memberLimit"],
        elite: json["elite"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "clubName": clubName,
        "genre": genre,
        "description": description,
        "status": status,
        "memberLimit": memberLimit,
        "elite": elite,
      };
}
