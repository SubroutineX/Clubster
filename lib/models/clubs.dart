import 'package:get/state_manager.dart';

class Club {
  final String imgUrl;
  final String name;
  final String status;
  final String id;
  final String description;
  final String genre;

  bool popular = false;

  final members = 0.obs;
  final followers = 0.obs;
  final bookmark = false.obs;
  final like = false.obs;

  Club({
    this.imgUrl,
    this.description,
    this.name,
    this.status,
    this.id,
    this.popular,
    this.genre,
  });
}
