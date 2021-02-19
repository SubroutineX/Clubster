import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/page_navigator.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.isDarkMode
            ? Get.changeTheme(ThemeData.light())
            : Get.changeTheme(ThemeData.dark()),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: bw(),
            expandedHeight: 150,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: colorFont(),
              ),
              onPressed: () {
                Get.offAll(PageNavigator());
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              titlePadding: EdgeInsets.only(
                left: 50,
                top: 10,
                bottom: 15,
              ),
              title: Text(
                "Settings",
                style: textStyleGilroyM(
                  20,
                  colorFont(),
                ),
              ),
              background: Column(
                children: [
                  Spacer(),
                  Container(
                    height: 3,
                    color: dividerColor(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: bw(),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: GestureDetector(
                              onTap: () {
                                if (Get.isDarkMode) {
                                  setState(
                                    () {
                                      Get.changeTheme(ThemeData.light());
                                      setState(() {});
                                    },
                                  );
                                } else {
                                  setState(
                                    () {
                                      Get.changeTheme(ThemeData.dark());
                                      setState(() {});
                                    },
                                  );
                                }
                              },
                              child: AnimatedContainer(
                                duration: Duration(
                                  milliseconds: 500,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: cardColor(),
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowColor(),
                                      blurRadius: 20,
                                      spreadRadius: -5,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cardColor(),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor(),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }
}
