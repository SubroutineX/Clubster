import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/models/clubs.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    Key key,
    this.buttonText,
    this.width,
    this.height,
    this.multiple,
    this.padding,
    this.onTapCall,
    this.color,
    this.splashColor,
    this.textStyle,
    this.borderRadius,
    this.txtColor,
  }) : super(key: key);

  final String buttonText;
  final Color txtColor;
  final double width;
  final double height;
  final double multiple;
  final double padding;
  final VoidCallback onTapCall;
  final Color color;
  final Color splashColor;
  final TextStyle textStyle;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context).size;
    return Material(
      shape: borderRadius == null
          ? StadiumBorder()
          : RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
      color: color,
      child: InkWell(
        borderRadius:
            borderRadius != null ? borderRadius : BorderRadius.circular(30),
        onTap: onTapCall,
        focusColor: splashColor,
        highlightColor: splashColor,
        splashColor: splashColor,
        hoverColor: splashColor,
        child: Container(
          height: height,
          padding: padding == null
              ? EdgeInsets.all(0)
              : EdgeInsets.symmetric(
                  horizontal: padding * 2,
                  vertical: padding,
                ),
          width: width != null ? width : deviceDimension.width * multiple,
          decoration: BoxDecoration(
            borderRadius:
                borderRadius != null ? borderRadius : BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: textStyle == null
                  ? textStyleSofiaSB(18, txtColor)
                  : textStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtonBuilder extends StatelessWidget {
  const IconButtonBuilder({
    Key key,
    @required this.icon,
    this.buttonText,
    this.width,
    this.height,
    this.multiple,
    this.padding,
    this.onTapCall,
    this.color,
    this.splashColor,
    this.textStyle,
    this.borderRadius,
  }) : super(key: key);

  final IconData icon;
  final String buttonText;
  final double width;
  final double height;
  final double multiple;
  final double padding;
  final VoidCallback onTapCall;
  final Color color;
  final Color splashColor;
  final TextStyle textStyle;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context).size;
    return Material(
      shape: borderRadius == null
          ? StadiumBorder()
          : RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
      color: color,
      child: InkWell(
        borderRadius:
            borderRadius != null ? borderRadius : BorderRadius.circular(30),
        onTap: onTapCall,
        focusColor: splashColor,
        highlightColor: splashColor,
        splashColor: splashColor,
        hoverColor: splashColor,
        child: Container(
          height: height,
          padding: padding == null
              ? EdgeInsets.all(0)
              : EdgeInsets.symmetric(
                  horizontal: padding * 2,
                  vertical: padding,
                ),
          width: width != null ? width : deviceDimension.width * multiple,
          decoration: BoxDecoration(
            borderRadius:
                borderRadius != null ? borderRadius : BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 14,
                color: white,
              ),
              SizedBox(width: 5),
              Text(
                buttonText,
                style: textStyle == null ? joinStyle : textStyle,
              ),
            ],
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
    this.borderRadius,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final List<Color> colors;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: borderRadius == null
          ? StadiumBorder()
          : RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(15)
                  : borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: AlignmentDirectional.bottomEnd,
                colors: colors,
              )),
          child: Center(
            child: Text(
              buttonText,
              style: textStyleSofiaB(20, white),
            ),
          ),
        ),
      ),
    );
  }
}

class LikeButtonBuilder extends StatelessWidget {
  const LikeButtonBuilder(
      {Key key,
      @required this.clubInfo,
      this.size,
      this.iconSize,
      this.shadowColor})
      : super(key: key);

  final dynamic clubInfo;
  final double size;
  final double iconSize;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GetX<ClubController>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            clubInfo.like.value = !clubInfo.like.value;
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                    color: shadowColor != null ? shadowColor : Colors.grey[200],
                    blurRadius: 10),
              ],
              color: Colors.white,
            ),
            child: Center(
              child: clubInfo.like.value
                  ? Icon(
                      Icons.favorite_rounded,
                      size: iconSize,
                      color: clubInfo.like.value ? red : Colors.grey[600],
                    )
                  : Icon(
                      Icons.favorite_outline_rounded,
                      size: iconSize,
                      color: clubInfo.like.value ? red : Colors.grey[600],
                    ),
            ),
          ),
        );
      },
    );
  }
}

class BookmarkButtonBuilder extends StatelessWidget {
  const BookmarkButtonBuilder({
    Key key,
    @required this.clubInfo,
    this.size,
    this.iconSize,
    this.shadowColor,
  }) : super(key: key);

  final Club clubInfo;
  final double size;
  final double iconSize;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return GetX<ClubController>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            clubInfo.bookmark.value = !clubInfo.bookmark.value;
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                    color: shadowColor != null ? shadowColor : Colors.grey[200],
                    blurRadius: 10),
              ],
              color: Colors.white,
            ),
            child: Center(
              child: clubInfo.bookmark.value
                  ? Icon(
                      Icons.bookmark_rounded,
                      size: iconSize,
                      color:
                          clubInfo.bookmark.value ? yellow : Colors.grey[600],
                    )
                  : Icon(
                      Icons.bookmark_outline_rounded,
                      size: iconSize,
                      color:
                          clubInfo.bookmark.value ? yellow : Colors.grey[600],
                    ),
            ),
          ),
        );
      },
    );
  }
}
