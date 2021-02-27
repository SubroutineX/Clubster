import 'package:flutter/material.dart';
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
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: yellow,
                  ),
                  tabs: [
                    Tab(
                      text: "My Posts",
                    ),
                    Tab(
                      text: "My Clubs",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          PostCardPadding(),
                          PostCardPadding(),
                          PostCardPadding(),
                          PostCardPadding(),
                          PostCardPadding(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Clubs Created",
                              style: tabLabelStyle,
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              "Clubs Created",
                              style: tabLabelStyle,
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  PostCard(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
