import 'package:flutter/material.dart';
import 'dart:math' as math;

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/views/widgets/search.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

//WIDGETS
import 'package:workflow/views/widgets/genre_cards.dart';
import 'package:workflow/views/widgets/club_cards.dart';

class ClubViewBody extends StatefulWidget {
  @override
  _ClubViewBodyState createState() => _ClubViewBodyState();
}

class _ClubViewBodyState extends State<ClubViewBody> {
  bool dismissed = false;
  final clubController = Get.put(ClubController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: bw(),
          elevation: 0,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discover Clubs",
                            style: textStyleGilroySB(
                              20,
                              colorFont(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: inputFieldColor(),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            showCustomSearch(
                              context: context,
                              delegate: ClubSearch(),
                            );
                          },
                          child: AbsorbPointer(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search...",
                                hintStyle: textStyleSofiaR(
                                  16,
                                  inputFontColor(),
                                ),
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: inputFontColor(),
                                ),
                              ),
                            ),
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
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !dismissed
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20,
                        ),
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.horizontal,
                          onDismissed: (card) {
                            print(card);
                            setState(() {
                              dismissed = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: violet.withOpacity(.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Learn something new\neveryday",
                                        style: TextStyle(
                                          fontFamily: "Gilroy_Bold",
                                          fontSize: 17,
                                          color: violet,
                                        ),
                                      ),
                                      Text(
                                        "Join new clubs and learn \nnew things",
                                        style: TextStyle(
                                          fontFamily: "Gilroy_Medium",
                                          fontSize: 14,
                                          color: violet.withOpacity(.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Center(
                                      child:
                                          Image.asset("assets/images/team.png"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Explore genres",
                          style: textStyleSofiaSB(
                            18,
                            colorFont(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: deviceDimensions.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              for (int i = 0; i < genres.length; i++)
                                genreBuilder(
                                  genres[i].name,
                                  genres[i].imagePath,
                                  genres[i].servingRestaurants,
                                  genres[i].backgroungColor,
                                )
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Popular ",
                                style: textStyleSofiaSB(
                                  18,
                                  violet,
                                ),
                              ),
                              TextSpan(
                                text: "Clubs",
                                style: textStyleSofiaSB(
                                  18,
                                  colorFont(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: deviceDimensions.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: GetX<ClubController>(
                          builder: (controller) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  for (int i = 0;
                                      i < controller.clubs.length;
                                      i++)
                                    if (controller.clubs[i].elite == "Yes")
                                      ClubInfoCard(
                                        clubInfo: controller.clubs[i],
                                      ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Other ",
                                style: textStyleSofiaSB(
                                  18,
                                  violet,
                                ),
                              ),
                              TextSpan(
                                text: "Clubs",
                                style: textStyleSofiaSB(
                                  18,
                                  colorFont(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GetX<ClubController>(
                        builder: (controller) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                for (int j = 0;
                                    j < controller.clubs.length;
                                    j++)
                                  if (controller.clubs[j].elite == "No")
                                    ClubInfoCard(
                                      clubInfo: controller.clubs[j],
                                    ),
                                SizedBox(width: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ClubSearch extends CustomSearch {
  List clubs = [
    "Dancer mania",
    "Inventerrs",
    "Cricket Club",
    "Rocket Science",
    "Coders",
    "Placement Cell"
  ];
  List recentClubs = [
    "Rocket Science",
    "Coders",
    "Placement Cell",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: inputFontColor(),
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.chevron_left,
        color: inputFontColor(),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 300,
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentClubs
        : clubs
            .where((string) =>
                string.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return suggestions.isEmpty
        ? Container(
            height: 200,
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "'" + query + "'",
                  style: textStyleGilroyB(
                    16,
                    colorFont(),
                  ),
                  children: [
                    TextSpan(
                      text: " not found",
                      style: textStyleGilroyM(
                        16,
                        colorFontLight(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  query = suggestions[index];
                  setCursorPosition(suggestions[index].length);
                  showResults(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        child: query.isEmpty
                            ? Icon(
                                Icons.history,
                                color: inputFontColor(),
                              )
                            : Icon(
                                Icons.search,
                                color: inputFontColor(),
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 15,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: suggestions[index]
                                        .substring(0, query.length),
                                    style: textStyleGilroyM(
                                      16,
                                      colorFont(),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: suggestions[index]
                                            .substring(query.length),
                                        style: textStyleGilroyM(
                                          16,
                                          inputFontColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: math.pi / 4,
                                child: Icon(
                                  Icons.arrow_back,
                                  color: inputFontColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
