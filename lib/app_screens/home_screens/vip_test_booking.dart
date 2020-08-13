import 'package:flutter/material.dart';
import 'package:flutter_covid/app_screens/home_screens/booking_confirmation.dart';
import 'package:flutter_covid/app_screens/utils/size_config.dart';
import 'package:flutter_covid/model/lab_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_Text.dart';
import 'package:flutter_covid/reusable_widget/reusable_material_button.dart';
import 'package:flutter_covid/reusable_widget/reusable_textField.dart';
import 'package:easy_localization/easy_localization.dart';

const List<String> cities = [
  "Abu Dhabi",
  "Sharjah",
  "Ajman",
  "Fujairah",
  "Dubai"
];

class VipTestBooking extends StatefulWidget {
  final LabModel labModel;

  VipTestBooking({this.labModel});

  @override
  _VipTestBookingState createState() => _VipTestBookingState();
}

class _VipTestBookingState extends State<VipTestBooking> {
  String _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Address",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.3,
            child: Placeholder(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  ReusableText(
                    text: "Address".tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableTextField(),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableText(
                    text: "Select City".tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    color: Colors.white,

//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Padding(
//                          padding: const EdgeInsets.only(left: 8.0),
//                          child: Text(
//                            "",
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
//                        Icon(
//                          Icons.keyboard_arrow_down,
//                          color: Colors.black,
//                        ),
//                      ],
//                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        value: _selectedValue,
                        items: cities
                            .map((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ).tr(),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableText(
                    text: "Building / Villa name".tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableTextField(),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableText(
                    text: "Apartment / Villa Number".tr(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReusableTextField(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.07,
                  ),
                  ReusableMaterialButton(
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
