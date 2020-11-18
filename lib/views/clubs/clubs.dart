import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class Clubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Center(
                    child: TextFormField(
                      style: formFieldStyle,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: fontColor,
                          ),
                          border: InputBorder.none,
                          hintText: "search clubs...",
                          hintStyle: searchLabelStyle),
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
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, int index) {
                          return Container(
                            color: Colors.red,
                            margin: EdgeInsets.only(left: 20),
                            height: 100,
                            width: 100,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    FadeAnimation(
                      1,
                      Text(
                        "Other",
                        style: appBarHead,
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
