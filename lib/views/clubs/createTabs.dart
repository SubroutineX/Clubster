import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/create_club.dart';
import 'package:workflow/views/clubs/create_seminars.dart';
import 'package:workflow/views/clubs/create_workshop.dart';
import 'package:workflow/views/styles/colors.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Container(
      width: deviceDimensions.width,
      height: deviceDimensions.height,
      child: DefaultTabController(
        length: 3,
        child: Theme(
          data: ThemeData(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Container(),
              elevation: 0,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                  labelPadding: EdgeInsets.all(0),
                  unselectedLabelColor: Colors.teal,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal.withOpacity(.1),
                  ),
                labelColor: Colors.teal,
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Club",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Sofia_Pro",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Workshop",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Sofia_Pro",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Seminar",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Sofia_Pro",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                CreateClub(),
                Createworkshop(),
                Createseminars(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}