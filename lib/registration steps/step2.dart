import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/styles.dart';

Step _secondStep() {
  return Step(
    isActive: false,
    state: StepState.indexed,
    title: Text(
      'Step 2',
      style: formFieldStyle,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        FadeAnimation(
          3,
          Text(
            "User",
            style: labelStyle,
          ),
        ),
        SizedBox(height: 10),
        FadeAnimation(
          4,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              children: <Widget>[
                RadioTile(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class RadioTile extends StatelessWidget {
  const RadioTile({
    Key key,
    @required this.user,
  }) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Lafayette'),
      leading: Radio(
        value: "Student",
        groupValue: user,
        onChanged: (value) {},
      ),
    );
  }
}
