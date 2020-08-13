import 'package:flutter/material.dart';
import 'package:flutter_covid/app_screens/utils/size_config.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:flutter_covid/model/lab_model.dart';
import 'package:flutter_covid/reusable_widget/reusable_material_button.dart';
import 'package:easy_localization/easy_localization.dart';

class BookingConfirmation extends StatelessWidget {
  final LabModel model;

  BookingConfirmation({this.model});

  @override
  Widget build(BuildContext context) {
    print(model.testType);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Confirmation",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Appointment",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ReusableRow(
                          model: model,
                          title: "Test Type: ".tr(),
                          desc: "${model.testType}".tr(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableRow(
                          model: model,
                          title: "Patient Name: ".tr(),
                          desc: "Google",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableRow(
                          model: model,
                          title: "Emirates ID Number: ".tr(),
                          desc: "123-4567-789543-9",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableRow(
                          model: model,
                          title: "Test Date: ".tr(),
                          desc: "12/08/2020",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableRow(
                          model: model,
                          title: "Preferable Test Time: ".tr(),
                          desc: "Morning(8:00 AM - 12:00 PM)".tr(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableRow(
                          model: model,
                          title: "Laboratory: ".tr(),
                          desc: "${model.labName}",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Test Price",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Table(
                        columnWidths: {2: FractionColumnWidth(.2)},
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                child: Text(
                                  "Service",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ).tr(),
                              ),
                              Text(""),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).tr(),
                              ),
                            ],
                            decoration: BoxDecoration(
                              color: color,
                            ),
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Text(
                                  "${model.testType}",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).tr(),
                              ),
                              Text(""),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "AED 370",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).tr(),
                              ),
                            ],
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]),
                                )),
                          ),
                          TableRow(
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                child: Text(
                                  "Sub Total",
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.end,
                                ).tr(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "AED 370",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ).tr(),
                              ),
                            ],
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]),
                                )),
                          ),
                          TableRow(
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ).tr(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "AED 370",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ).tr(),
                              ),
                            ],
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[300]),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ReusableMaterialButton(
              title: "Pay Now ( AED 370 )".tr(),
              pressMe: () {},
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final LabModel model;
  final String title;
  final String desc;
  ReusableRow({this.model, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Text(
              desc,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
