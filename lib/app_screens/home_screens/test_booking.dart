import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/app_screens/utils/size_config.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:flutter_covid/model/lab_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_Text.dart';
import 'package:flutter_covid/reusable_widget/reusable_material_button.dart';
import 'package:flutter_covid/reusable_widget/reusable_textField.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'booking_confirmation.dart';
import 'package:easy_localization/easy_localization.dart';

const List<Map<String, dynamic>> timing = [
  {
    "timing": "8:00 AM - 12:00 PM",
    "day": "Morning",
    "image": "images/Morning.png"
  },
  {
    "timing": "12:00 PM - 5:00 PM",
    "day": "Afternoon",
    "image": "images/afternoon.png"
  },
  {"timing": "5:00 PM - 10:00 PM", "day": "Night", "image": "images/night.png"},
];

class TestBooking extends StatefulWidget {
  final LabModel labModel;

  TestBooking({this.labModel});

  @override
  _TestBookingState createState() => _TestBookingState();
}

class _TestBookingState extends State<TestBooking> {
  int selectedIndex = 1;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Booking",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              widget.labModel.image,
                              fit: BoxFit.cover,
                              width: 80,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.labModel.labName,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Test Type:",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).tr(),
                                Text(
                                  widget.labModel.testType,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ).tr(),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableText(
                        text: "Full Name (as in Emirates ID)".tr(),
                      ),
                      ReusableTextField(),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableText(
                        text: "Emirates ID Number".tr(),
                      ),
                      ReusableTextField(),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableText(
                        text: "Mobile Number".tr(),
                      ),
                      ReusableTextField(),
                      SizedBox(
                        height: 20,
                      ),
                      ReusableText(
                        text: "Select Test Date",
                      ),
                      GestureDetector(
                        onTap: () {
                          Platform.isAndroid
                              ? showAndroidDatePicker(context)
                              : showIOSDatePicker(context);
                        },
                        child: Container(
                          width: SizeConfig.screenWidth / 2,
                          height: 40,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "${selectedDate.toLocal()}"
                                      .split(' ')[0]
                                      .replaceAll("-", "/"),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: color,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FittedBox(
                        child: Text(
                          "testTime".tr(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            3,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? Color(0xff85A2C7)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      timing[index]["image"],
                                      width: 80,
                                    ),
                                    Text(
                                      timing[index]["day"],
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.grey[400],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                    Text(
                                      timing[index]["timing"],
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.grey[400],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SafeArea(
              bottom: true,
              child: ReusableMaterialButton(
                title: "Continue".tr(),
                pressMe: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BookingConfirmation(
                      model: widget.labModel,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showIOSDatePicker(BuildContext context) {
    //default CupertinoDatePicker
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext builder) {
//          return Container(
//            height: MediaQuery.of(context).copyWith().size.height / 3,
//            color: Colors.white,
//            child: CupertinoDatePicker(
//              mode: CupertinoDatePickerMode.date,
//              onDateTimeChanged: (picked) {
//                if (picked != null)
//                  setState(() {
//                    selectedDate = "${picked.toLocal()}".split(' ')[0];
//                  });
//              },
//              initialDateTime: DateTime.now(),
//              minimumYear: 2000,
//              maximumYear: 2025,
//            ),
//          );
//        });

    // if DiagnosticableMixin error came just change it to Diagnosticable by allowing edit.

    DatePicker.showDatePicker(context,
        minDateTime: DateTime(2020),
        maxDateTime: DateTime(2021, 12, 31),
        initialDateTime: selectedDate,
        locale: DateTimePickerLocale.en_us,
        pickerMode: DateTimePickerMode.date,
        pickerTheme: DateTimePickerTheme.Default, onConfirm: (picked, index) {
      setState(() {
        selectedDate = picked;
      });
    });
  }

  showAndroidDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2021, 12, 31),
    ).then((value) {
      setState(() {
        if (value != null) {
          selectedDate = value;
        }
      });
    });
  }
}
