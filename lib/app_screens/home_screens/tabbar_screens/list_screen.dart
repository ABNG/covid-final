import 'package:flutter/material.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:flutter_covid/model/lab_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_row.dart';
import 'package:easy_localization/easy_localization.dart';
import '../test_booking.dart';
import '../vip_test_booking.dart';

class SelectLabScreen extends StatelessWidget {
  final String testType;

  SelectLabScreen({this.testType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: LabModel.labItem.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GestureDetector(
          onTap: () {
            LabModel.labItem[index].testType = testType;
            testType == "VIP Test"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          VipTestBooking(labModel: LabModel.labItem[index]),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TestBooking(
                        labModel: LabModel.labItem[index],
                      ),
                    ),
                  );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    LabModel.labItem[index].image,
                    fit: BoxFit.cover,
                    width: 80,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LabModel.labItem[index].labName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.amberAccent.withOpacity(0.5),
                        ),
                        Text(
                          LabModel.labItem[index].rating.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${LabModel.labItem[index].rating} " + "kms Away".tr(),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        var snackbar = SnackBar(
                          content: Text(
                            "maps button pressed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          action: SnackBarAction(
                            onPressed: () {},
                            label: "OK",
                            textColor: Colors.white,
                          ),
                        );
                        Scaffold.of(context).showSnackBar(snackbar);
                      },
                      child: ReusableRows(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "BOOK NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ).tr(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
