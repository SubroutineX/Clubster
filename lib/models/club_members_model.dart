// To parse this JSON data, do
//
//     final ClubMember = clubMembersFromJson(jsonString);

import 'dart:convert';

List<ClubMember> clubMembersFromJson(String str) =>
    List<ClubMember>.from(json.decode(str).map((x) => ClubMember.fromJson(x)));

String clubMembersToJson(List<ClubMember> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClubMember {
  ClubMember({
    this.id,
    this.user,
    this.role,
  });

  String id;
  String user;
  String role;

  factory ClubMember.fromJson(Map<String, dynamic> json) => ClubMember(
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
