import 'package:flutter/foundation.dart';
import 'package:workflow/models/story_model.dart';

class User {
  final String name;
  final String profileImageUrl;

  const User({
    @required this.name,
    @required this.profileImageUrl,
  });
}

List<User> user = [
  User(
    name: 'Nikhil Shinde',
    profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
  )
];
