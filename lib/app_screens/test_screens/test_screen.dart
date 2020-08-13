import 'package:flutter/material.dart';
import 'package:flutter_covid/model/test_detail_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_container.dart';
import 'package:easy_localization/easy_localization.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "myTest",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
      body: ListView.builder(
          itemCount: TestDetail.testDetail.length,
          itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ReusableContainers(
                  testDetail: TestDetail.testDetail[index],
                  isTestScreen: true,
                ),
              )),
    );
  }
}
