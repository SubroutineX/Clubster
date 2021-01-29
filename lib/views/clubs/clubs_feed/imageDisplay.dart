import 'package:flutter/material.dart';
import 'package:workflow/views/styles/colors.dart';

class ImageView extends StatelessWidget {
  final String tag;

  const ImageView({Key key, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: black.withOpacity(1),
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            width: double.infinity,
            child: Hero(
              tag: tag,
              child: Image.asset(
                tag,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
