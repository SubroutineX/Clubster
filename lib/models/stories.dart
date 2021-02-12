import 'package:get/get.dart';
import 'package:workflow/views/widgets/storyBuilder.dart';

class Stories extends GetxController {
  final seen = false.obs;
  String storyName;
  String imageUrl;

  Stories({
    this.storyName,
    this.imageUrl,
  });
}
