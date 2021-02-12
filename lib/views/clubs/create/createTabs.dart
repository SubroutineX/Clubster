import 'package:flutter/material.dart';

//PAGES
import 'package:workflow/views/clubs/create/create_club.dart';
import 'package:workflow/views/clubs/create/create_seminars.dart';
import 'package:workflow/views/clubs/create/create_workshop.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

//WIDGETS
import 'package:workflow/views/widgets/tab_builder.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: clubsBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: fontColor,
          ),
        ),
        // actions: [
        //   IconButton(
        //     tooltip: "Logout",
        //     icon: Icon(
        //       Icons.login_outlined,
        //       color: fontColor,
        //     ),
        //   ),
        // ],
        iconTheme: IconThemeData(color: fontColor),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0,
        title: Text(
          "Create",
          style: textStyleSofiaSB(18, fontColor),
        ),
      ),
      body: Container(
        width: deviceDimensions.width,
        height: deviceDimensions.height,
        child: DefaultTabController(
          length: 3,
          child: Theme(
            data: ThemeData(
              hoverColor: transparent,
              focusColor: transparent,
              highlightColor: transparent,
              splashColor: transparent,
            ),
            child: Scaffold(
              backgroundColor: transparent,
              appBar: AppBar(
                backgroundColor: transparent,
                leading: Container(),
                elevation: 0,
                flexibleSpace: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    unselectedLabelColor: teal,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.teal.withOpacity(.1),
                    ),
                    labelColor: teal,
                    tabs: [
                      TabBuilder(
                        tabName: "Club",
                        color: teal,
                      ),
                      TabBuilder(
                        tabName: "Workshop",
                        color: teal,
                      ),
                      TabBuilder(
                        tabName: "Seminar",
                        color: teal,
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  CreateClub(),
                  CreateWorkshop(),
                  CreateSeminar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
