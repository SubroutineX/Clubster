// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.userData,
    this.createdClubs,
    this.joinedClubs,
  });

  UserData userData;
  List<EdClub> createdClubs;
  List<EdClub> joinedClubs;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        userData: UserData.fromJson(json["userData"]),
        createdClubs: List<EdClub>.from(
            json["createdClubs"].map((x) => EdClub.fromJson(x))),
        joinedClubs: List<EdClub>.from(
            json["joinedClubs"].map((x) => EdClub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userData": userData.toJson(),
        "createdClubs": List<dynamic>.from(createdClubs.map((x) => x.toJson())),
        "joinedClubs": List<dynamic>.from(joinedClubs.map((x) => x.toJson())),
      };
}

class EdClub {
  EdClub({
    this.id,
    this.clubName,
    this.genre,
    this.description,
    this.status,
    this.memberLimit,
    this.elite,
    this.college,
    this.timeStamp,
    this.v,
    this.members,
  });

  String id;
  String clubName;
  String genre;
  String description;
  String status;
  int memberLimit;
  String elite;
  String college;
  String timeStamp;
  int v;
  List<dynamic> members;

  factory EdClub.fromJson(Map<String, dynamic> json) => EdClub(
        id: json["_id"],
        clubName: json["clubName"],
        genre: json["genre"],
        description: json["description"],
        status: json["status"],
        memberLimit: json["memberLimit"],
        elite: json["elite"],
        college: json["college"],
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"],
        v: json["__v"],
        members: json["members"] == null
            ? null
            : List<dynamic>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "clubName": clubName,
        "genre": genre,
        "description": description,
        "status": status,
        "memberLimit": memberLimit,
        "elite": elite,
        "college": college,
        "timeStamp": timeStamp == null ? null : timeStamp,
        "__v": v,
        "members":
            members == null ? null : List<dynamic>.from(members.map((x) => x)),
      };
}

class UserData {
  UserData({
    this.id,
    this.name,
    this.userName,
    this.user,
    this.phone,
    this.college,
    this.dept,
    this.v,
  });

  String id;
  String name;
  String userName;
  String user;
  String phone;
  String college;
  String dept;
  int v;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        name: json["name"],
        userName: json["userName"],
        user: json["user"],
        phone: json["phone"],
        college: json["college"],
        dept: json["dept"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "userName": userName,
        "user": user,
        "phone": phone,
        "college": college,
        "dept": dept,
        "__v": v,
      };
}
