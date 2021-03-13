// To parse this JSON data, do
//
//     final requests = requestsFromJson(jsonString);

import 'dart:convert';

List<Requests> requestsFromJson(String str) =>
    List<Requests>.from(json.decode(str).map((x) => Requests.fromJson(x)));

String requestsToJson(List<Requests> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Requests {
  Requests({
    this.id,
    this.user,
    this.description,
    this.timeStamp,
  });

  String id;
  String user;
  String description;
  String timeStamp;

  factory Requests.fromJson(Map<String, dynamic> json) => Requests(
        id: json["_id"],
        user: json["user"],
        description: json["description"],
        timeStamp: json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "description": description,
        "timeStamp": timeStamp,
      };
}
