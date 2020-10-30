import 'package:flutter/material.dart';
import 'package:workflow/views/custom_indicator.dart';
import 'package:workflow/views/login_page.dart';
import 'package:workflow/views/register_page.dart';
import 'package:workflow/views/styles/styles.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      indicator: CustomIndicator(
                        indicatorHeight: 3,
                        indicatorColor: Color(0xff1967d2),
                        indicatorSize: CustomIndicatorSize.normal,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Login",
                                style: tabLabelStyle,
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
                                "Register",
                                style: tabLabelStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Loginpage(_tabController),
                    RegisterPage(),
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
