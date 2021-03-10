// To parse this JSON data, do
//
//     final welcome = clubsFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Club> clubsFromJson(String str) =>
    List<Club>.from(json.decode(str).map((x) => Club.fromJson(x)));

String clubsToJson(List<Club> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Club extends GetxController {
  Club(
      {this.id,
      this.clubName,
      this.genre,
      this.description,
      this.status,
      this.memberLimit,
      this.elite,
      this.requested,
      this.following,
      this.joined});

  String id;
  String clubName;
  String genre;
  String description;
  String status;
  int memberLimit;
  String elite;

  bool requested = false;
  bool joined = false;
  bool following = false;
  final members = 0.obs;
  final followers = 0.obs;
  final bookmark = false.obs;
  final like = false.obs;

  factory Club.fromJson(Map<String, dynamic> json) => Club(
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
