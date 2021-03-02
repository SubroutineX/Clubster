import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/club_profile/profileClubs.dart';
import 'package:workflow/views/clubs/club_profile/profilePosts.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ProfileTabview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context).size;
    return Container(
      height: deviceDimension.height,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: white,
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                child: Material(
                  shape: StadiumBorder(),
                  color: blue.withOpacity(0.15),
                  child: TabBar(
                    unselectedLabelStyle: textStyleSofiaR(16, white),
                    labelStyle: textStyleSofiaSB(16, white),
                    unselectedLabelColor: blue,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: blue,
                    ),
                    tabs: [
                      Tab(
                        text: "Clubs",
                      ),
                      Tab(
                        text: "Posts",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProfileClubs(),
                    ProfilePosts(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCardPadding extends StatelessWidget {
  const PostCardPadding({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: <Widget>[
          PostCard(),
          SizedBox(
            width: 10,
          ),
          PostCard(),
          SizedBox(
            width: 10,
          ),
          PostCard(),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 115,
      decoration: BoxDecoration(
        color: lightred,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
