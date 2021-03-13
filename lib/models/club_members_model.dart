// To parse this JSON data, do
//
//     final clubMembers = clubMembersFromJson(jsonString);

import 'dart:convert';

List<ClubMembers> clubMembersFromJson(String str) => List<ClubMembers>.from(
    json.decode(str).map((x) => ClubMembers.fromJson(x)));

String clubMembersToJson(List<ClubMembers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClubMembers {
  ClubMembers({
    this.id,
    this.user,
    this.role,
  });

  String id;
  String user;
  String role;

  factory ClubMembers.fromJson(Map<String, dynamic> json) => ClubMembers(
        id: json["_id"],
        user: json["user"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "role": role,
      };
}
