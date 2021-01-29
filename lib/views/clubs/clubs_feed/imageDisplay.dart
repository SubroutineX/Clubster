import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/styles/colors.dart';

class ImageView extends StatelessWidget {
  final String tag;

  const ImageView({Key key, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: black.withOpacity(1),
        child: Column(
          children: [
            Expanded(child: Container()),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: InteractiveViewer(
                constrained: true,
                alignPanAxis: true,
                panEnabled: true, // Set it to false
                boundaryMargin: EdgeInsets.all(0),
                minScale: 1,
                maxScale: 1.75,
                child: Hero(
                  tag: tag,
                  child: Image.asset(
                    tag,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
