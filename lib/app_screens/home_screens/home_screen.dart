import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/app_screens/home_screens/lab_selection_screen.dart';
import 'package:flutter_covid/app_screens/utils/size_config.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:flutter_covid/model/test_detail_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_container.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.sort,
            color: color,
          ),
          title:
              //RichText(
//          text: TextSpan(
//              text: "Covid-19".tr(),
//              style: TextStyle(
//                color: Colors.black,
//                fontWeight: FontWeight.w900,
//                fontSize: 16,
//              ),
//              children: [
//                TextSpan(
//                  text: "tests".tr(),
//                  style: TextStyle(
//                    color: Colors.black,
//                    fontWeight: FontWeight.w500,
//                    fontSize: 16,
//                  ),
//                ),
//              ]),
//        ),
              Image.asset(
            'images/Logo.png',
            width: 150,
          )),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blueGrey,
                        image: DecorationImage(
                          image: AssetImage(
                            "images/first.jpg",
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  ReusableContainers(
                    testDetail: TestDetail.testDetail[0],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Book a Test",
                      style: TextStyle(
                        color: color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => navigation(context, "Blood Test"),
                          child: ReusableContainer(
                            title: "Blood Test".tr(),
                            image: "images/Blood-Test.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => navigation(context, "Swap Test"),
                          child: ReusableContainer(
                            title: "Swap Test".tr(),
                            image: "images/Sway-Test.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => navigation(context, "VIP Test"),
                    child: ReusableContainer(
                      title: "VIP Test (At your home)".tr(),
                      image: "images/VIP-test.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigation(BuildContext context, String testType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => LabSelectionScreen(
                  testType: testType,
                )));
  }
}

class ReusableContainer extends StatelessWidget {
  final String title;
  final String image;

  ReusableContainer({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Flexible(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
