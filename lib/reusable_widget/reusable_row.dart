import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ReusableRows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "images/Maps.png",
          fit: BoxFit.cover,
          width: 45,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: Colors.black26,
              )),
          child: Text(
            "Get Direction",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
        )
      ],
    );
  }
}
