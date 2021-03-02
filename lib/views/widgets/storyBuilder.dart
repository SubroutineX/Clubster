import 'package:flutter/material.dart';
import 'package:workflow/models/user.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class StoryBuilder extends StatelessWidget {
  const StoryBuilder({
    Key key,
    this.user,
    this.onTapCall,
    this.seen,
  }) : super(key: key);
  final User user;
  final String localUrl = "assets/images/profile.jpg";
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
                    width: 1.8,
                    color: orange,
                  ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: GestureDetector(
              onTap: onTapCall,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: localUrl == null
                      ? Image.network(
                          user.profileImageUrl,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          localUrl,
                          fit: BoxFit.cover,
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
          user.name.length > 8
              ? user.name.toString().substring(0, 8) + "..."
              : user.name,
          style: textStyleGilroyM(
            12,
            colorFont(),
          ),
        ),
      ],
    );
  }
}

class UploadBuilder extends StatelessWidget {
  UploadBuilder({
    Key key,
    this.user,
    this.onTapCall,
  }) : super(key: key);

  final User user;
  final String localUrl = "assets/images/profile.jpg";
  final VoidCallback onTapCall;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 68,
          width: 68,
          decoration: BoxDecoration(
            color: transparent,
          ),
          child: Center(
            child: GestureDetector(
              onTap: onTapCall,
              child: Stack(
                children: [
                  Container(
                    height: 63,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: localUrl == null
                          ? Image.network(
                              user.profileImageUrl,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              localUrl,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bw(),
                      ),
                      child: Center(
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: orange,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: white,
                              size: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          user.name.length > 8
              ? user.name.toString().substring(0, 8) + "..."
              : user.name,
          style: textStyleGilroyM(12, colorFont()),
        ),
      ],
    );
  }
}
