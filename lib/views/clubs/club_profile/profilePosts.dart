import 'package:flutter/material.dart';
import 'package:workflow/views/styles/colors.dart';

class ProfilePosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (_, index) {
          return Container(
            color: lightred,
          );
        },
      ),
    );
  }
}
