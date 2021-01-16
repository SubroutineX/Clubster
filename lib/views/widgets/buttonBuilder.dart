import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    Key key,
    this.buttonText,
    this.width,
    this.multiple,
    this.padding,
    this.onTapCall,
    this.color,
  }) : super(key: key);

  final String buttonText;
  final double width;
  final double multiple;
  final double padding;
  final VoidCallback onTapCall;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context).size;
    return Material(
      shape: StadiumBorder(),
      color: blue,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTapCall,
        focusColor: color,
        highlightColor: color,
        splashColor: color,
        hoverColor: color,
        child: Container(
          height: 48,
          padding: padding == null
              ? EdgeInsets.all(0)
              : EdgeInsets.symmetric(
                  horizontal: padding * 2,
                  vertical: padding,
                ),
          width: width != null ? width : deviceDimension * multiple,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "Follow",
              style: joinStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButtonBuilder extends StatelessWidget {
  const GradientButtonBuilder({
    Key key,
    this.onTap,
    @required this.buttonText,
    this.colors,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: AlignmentDirectional.bottomEnd,
                colors: colors,
              )),
          child: Center(
            child: Text(
              buttonText,
              style: textStyleB(20, white),
            ),
          ),
        ),
      ),
    );
  }
}

class LikeButtonBuilder extends StatelessWidget {
  const LikeButtonBuilder({
    Key key,
    @required this.pageInfo,
    this.size,
  }) : super(key: key);

  final dynamic pageInfo;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size != null ? size : 48,
      height: size != null ? size : 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 10,
          )
        ],
      ),
      child: Center(
        child: GetX<ClubController>(
          builder: (controller) {
            return IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                pageInfo.like.value = !pageInfo.like.value;
              },
              icon: pageInfo.like.value
                  ? Icon(
                      Icons.favorite_rounded,
                      size: 20,
                    )
                  : Icon(
                      Icons.favorite_outline_rounded,
                      size: 20,
                    ),
              color: pageInfo.like.value ? red : Colors.grey[600],
            );
          },
        ),
      ),
    );
  }
}

class BookmarkButtonBuilder extends StatelessWidget {
  const BookmarkButtonBuilder({
    Key key,
    @required this.pageInfo,
    this.size,
  }) : super(key: key);

  final dynamic pageInfo;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size != null ? size : 48,
      height: size != null ? size : 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(color: Colors.grey[200], blurRadius: 10),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: GetX<ClubController>(
          builder: (controller) {
            return IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () {
                pageInfo.bookmark.value = !pageInfo.bookmark.value;
              },
              icon: pageInfo.bookmark.value
                  ? Icon(
                      Icons.bookmark_rounded,
                      size: 20,
                    )
                  : Icon(
                      Icons.bookmark_outline_rounded,
                      size: 20,
                    ),
              color: pageInfo.bookmark.value ? yellow : Colors.grey[600],
            );
          },
        ),
      ),
    );
  }
}
