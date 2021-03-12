// To parse this JSON data, do
//
//     final profilePosts = profilePostsFromJson(jsonString);

import 'dart:convert';

List<ProfilePosts> profilePostsFromJson(String str) => List<ProfilePosts>.from(
    json.decode(str).map((x) => ProfilePosts.fromJson(x)));

String profilePostsToJson(List<ProfilePosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfilePosts {
  ProfilePosts({
    this.id,
    this.fileName,
    this.caption,
    this.user,
    this.college,
    this.timeStamp,
    this.v,
    this.likes,
    this.comments,
  });

  String id;
  String fileName;
  String caption;
  String user;
  String college;
  String timeStamp;
  int v;
  int likes;
  int comments;

  factory ProfilePosts.fromJson(Map<String, dynamic> json) => ProfilePosts(
        id: json["_id"],
        fileName: json["fileName"],
        caption: json["caption"],
        user: json["user"],
        college: json["college"],
        timeStamp: json["timeStamp"],
        v: json["__v"],
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
        "__v": v,
        "likes": likes,
        "comments": comments,
      };
}
