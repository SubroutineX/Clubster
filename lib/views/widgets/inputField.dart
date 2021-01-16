import 'package:flutter/material.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class InputBuilder extends StatelessWidget {
  const InputBuilder({
    Key key,
    @required this.fieldController,
    this.inputHead,
    this.hintText,
    this.type,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String inputHead;
  final String hintText;
  final String type;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          inputHead != null ? inputHead : "Input field",
          style: labelStyle,
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            style: formFieldStyle,
            keyboardType: type != "number"
                ? TextInputType.emailAddress
                : TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText != null ? hintText : "Input field",
              hintStyle: hintStyle,
            ),
            controller: fieldController,
          ),
        ),
      ],
    );
  }
}
