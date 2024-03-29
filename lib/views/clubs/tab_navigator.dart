import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/club_view/club_view.dart';
import 'package:workflow/views/clubs/club_profile/club_profile.dart';
import 'package:workflow/views/clubs/clubs_feed/clubs_feed.dart';
import 'package:workflow/views/clubs/create/createTabs.dart';
import 'package:workflow/views/clubs/create/create_club.dart';
import 'package:workflow/views/clubs/create/create_club2.dart';
import 'package:workflow/views/styles/colors.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({Key key, this.navigatorKey, this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (tabItem == "Page1") {
      child = CreatePage();
    } else if (tabItem == "Page2") {
      child = ClubView();
    } else if (tabItem == "Page3") {
      child = ClubFeed();
    } else if (tabItem == "Page4") {
      child = Page4();
    } else if (tabItem == "Page5") {
      child = ProfilePage();
    }

    return Container(
      child: child,
    );

    // return Navigator(
    //   key: navigatorKey,
    //   onGenerateRoute: (routeSettings) {
    //     return MaterialPageRoute(builder: (context) => child);
    //   },
    // );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Page2"),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Page3"),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blue,
        automaticallyImplyLeading: false,
        title: Text("Dark mode switch"),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          onPressed: () {
            Get.isDarkMode
                ? Get.changeTheme(ThemeData.light())
                : Get.changeTheme(ThemeData.dark());
          },
        ),
      ),
    );
  }
}
