import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/app_screens/utils/size_config.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:easy_localization/easy_localization.dart';

bool isEnglish = true;
const List<Map<String, dynamic>> title = [
  {
    "icon": CupertinoIcons.news,
    "page": 1,
  },
  {
    "icon": CupertinoIcons.location_solid,
    "page": 2,
  },
  {
    "icon": Icons.language,
    "page": 3,
  },
  {
    "icon": Icons.info,
    "page": 4,
  },
  {
    "icon": Icons.power_settings_new,
    "page": 5,
  },
];

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: SizeConfig.screenHeight * 0.3,
            color: color,
            child: Row(
              children: [
                Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.1, right: 3),
                    child: Image.asset("images/Profile.png")),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "title",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "subtitle",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.07),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: List.generate(
                title.length,
                (index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        switch (title[index]['page']) {
                          case 1:
                            print("My Tests");
                            break;
                          case 2:
                            print("My Address");
                            break;
                          case 3:
                            showAlertDialog(context);
                            break;
                          case 4:
                            print("Help Center");
                            break;
                          case 5:
                            print("Sign Out");
                            break;
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            title[index]['icon'],
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "title${index + 1}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ).tr(),
                        ],
                      ),
                    ),
                    index + 1 == title.length ? SizedBox() : Divider(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(),
    );
  }
}

class CustomAlertDialog extends StatefulWidget {
  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      child: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Text(
                "language",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ).tr(),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isEnglish = false;
                  context.locale = Locale('ar', 'AE');

                  print(context.locale.toString());
                });
              },
              child: ReusablePadding(
                icon: isEnglish
                    ? Icons.radio_button_unchecked
                    : Icons.check_circle,
                iconColor: isEnglish ? Colors.grey : Colors.black,
                title: "🇦🇪",
                padding: EdgeInsets.all(20),
                language: "العربية",
                fontSize: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isEnglish = true;
                  context.locale = Locale('en', 'US');

                  print(context.locale.toString());
                });
              },
              child: ReusablePadding(
                icon: isEnglish
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                iconColor: isEnglish ? Colors.black : Colors.grey,
                title: "🇺🇸",
                padding: EdgeInsets.symmetric(horizontal: 20),
                language: "ENGLISH",
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusablePadding extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final padding;
  final language;
  final double fontSize;

  ReusablePadding(
      {this.icon,
      this.iconColor,
      this.title,
      this.padding,
      this.language,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            language,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          )
        ],
      ),
    );
  }
}
