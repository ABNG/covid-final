import 'package:flutter/material.dart';
import 'package:flutter_covid/constants/const.dart';

class ReusableText extends StatelessWidget {
  final String text;

  ReusableText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
