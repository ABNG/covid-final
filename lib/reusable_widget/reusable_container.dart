import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:flutter_covid/model/test_detail_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_row.dart';
import 'package:easy_localization/easy_localization.dart';

class ReusableContainers extends StatelessWidget {
  final TestDetail testDetail;
  final bool isTestScreen;
  ReusableContainers({this.testDetail, this.isTestScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: isTestScreen ? 0 : 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  'images/Test-icon.png',
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableRow(
                        text1: "Status: ".tr(),
                        text2: testDetail.status.tr(),
                        color: testDetail.status == "Confirmed"
                            ? Colors.green.shade700
                            : Colors.orange,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ReusableRow(
                        text1: "Test Type: ".tr(),
                        text2: testDetail.testType.tr(),
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ReusableRow(
                        text1: "Date: ".tr(),
                        text2: testDetail.date,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ReusableRow(
                        text1: "Laboratory: ".tr(),
                        text2: testDetail.laboratory,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        testDetail.tokenText,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: testDetail.tokenNumber == "55" ? 8 : 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: color,
                      ),
                      child: FittedBox(
                        child: Text(
                          testDetail.tokenNumber,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ).tr(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    testDetail.tokenNumber == "55"
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ).tr(),
                          )
                        : SizedBox(),
                    testDetail.tokenNumber == "55"
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              testDetail.time,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 10,
                          ),
                  ],
                ),
              )
            ],
          ),
          ReusableRows(),
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color;

  ReusableRow({this.text1, this.text2, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            text1,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: 11,
            ),
          ),
        ),
        Flexible(
          child: Text(
            text2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
