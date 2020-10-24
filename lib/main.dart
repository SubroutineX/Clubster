import 'package:flutter/material.dart';
import 'package:workflow/views/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'workflow managment demo',
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
