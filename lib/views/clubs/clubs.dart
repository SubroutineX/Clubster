import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/clubs/club_model/club_other_model.dart';
import 'package:workflow/views/clubs/club_model/club_popular_model.dart';
import 'package:workflow/views/clubs/club_other.dart';
import 'package:workflow/views/clubs/club_popular.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class Clubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: clubsBackground,
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_active_rounded,
                color: fontColor,
              ),
              onPressed: null),
        ],
        iconTheme: IconThemeData(color: fontColor),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0,
        title: Text(
          "Clubs",
          style: appBarHead,
        ),
      ),
      body: Container(
        height: deviceDimensions.height,
        width: deviceDimensions.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.12),
                      offset: Offset(0, 10),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 18, right: 12),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search clubs...",
                        hintStyle: searchBarStyle,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Popular",
                          style: appBarHead,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 220,
                      width: deviceDimensions.width,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            for (int i = 0; i < popularClubs.length; i++)
                              PopularClubs(
                                imgUrl: popularClubs[i].image,
                                name: popularClubs[i].name,
                                status: popularClubs[i].status,
                                id: popularClubs[i].id,
                                bookmark: popularClubs[i].bookmark,
                                like: popularClubs[i].like,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1,
                      Text(
                        "Other",
                        style: appBarHead,
                      ),
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          for (int j = 0; j < otherClubs.length; j++)
                            OtherClubs(
                              imgUrl: otherClubs[j].image,
                              name: otherClubs[j].name,
                              status: otherClubs[j].status,
                              id: otherClubs[j].id,
                              bookmark: otherClubs[j].bookmark,
                              like: otherClubs[j].like,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//                                 itemCount: clubs.length,
//                                 physics: BouncingScrollPhysics(),
//                                 scrollDirection: Axis.horizontal,
//                                 itemBuilder: (context, index) {
//                                   var club = clubs[index];
//                                   return PopularClubs(
//                                     imgUrl: club.image,
//                                     name: club.name,
//                                     status: club.status,
//                                     id: club.id,
//                                     bookmark: club.bookmark,
//                                     like: club.like,
//                                   );
//                                 },
//                               ),
