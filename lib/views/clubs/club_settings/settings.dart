import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.back();
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
