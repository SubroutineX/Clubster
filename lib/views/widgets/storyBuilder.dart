import 'package:flutter/material.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class StoryBuilder extends StatelessWidget {
  const StoryBuilder({
    Key key,
    this.storyName,
    this.storyUrl,
    this.onTapCall,
    this.localUrl,
    this.seen,
  }) : super(key: key);
  final String storyUrl;
  final String storyName;
  final String localUrl;
  final VoidCallback onTapCall;
  final bool seen;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 68,
          width: 68,
          decoration: BoxDecoration(
            border: seen
                ? Border.all(
                    width: 0,
                    color: transparent,
                  )
                : Border.all(
                    width: 1.5,
                    color: Color(0xff7f00ff),
                  ),
            // gradient: LinearGradient(
            //   begin: Alignment.bottomRight,
            //   colors: seen?.isNull ?? true
            //       ? [
            //           Color(0xff7f00ff),
            //           Color(0xffe100ff),
            //         ]
            //       : [
            //           transparent,
            //           transparent,
            //         ],
            // ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: GestureDetector(
              onTap: onTapCall,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: localUrl == null
                      ? Image.network(
                          storyUrl,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          fit: BoxFit.cover,
                          image: AssetImage(localUrl),
                        ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          storyName.length > 8
              ? storyName.toString().substring(0, 8) + "..."
              : storyName,
          style: textStyleR(12, fontColor),
        ),
      ],
    );
  }
}

class UploadBuilder extends StatelessWidget {
  const UploadBuilder({
    Key key,
    this.storyName,
    this.storyUrl,
    this.onTapCall,
    this.localUrl,
  }) : super(key: key);
  final String storyUrl;
  final String storyName;
  final String localUrl;
  final VoidCallback onTapCall;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 68,
          width: 68,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Color(0xff7f00ff),
                Color(0xffe100ff),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Center(
            child: GestureDetector(
              onTap: onTapCall,
              child: Container(
                height: 63,
                width: 63,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: localUrl == null
                      ? Image.network(
                          storyUrl,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          fit: BoxFit.cover,
                          image: AssetImage(localUrl),
                        ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          storyName.length > 8
              ? storyName.toString().substring(0, 8) + "..."
              : storyName,
          style: textStyleR(12, fontColor),
        ),
      ],
    );
  }
}
