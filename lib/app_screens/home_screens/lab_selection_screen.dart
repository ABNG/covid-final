import 'package:flutter/material.dart';
import 'package:flutter_covid/app_screens/home_screens/tabbar_screens/list_screen.dart';
import 'package:flutter_covid/app_screens/home_screens/tabbar_screens/map_screen.dart';
import 'package:flutter_covid/constants/const.dart';
import 'package:easy_localization/easy_localization.dart';

class LabSelectionScreen extends StatefulWidget {
  final String testType;

  LabSelectionScreen({this.testType});

  @override
  _LabSelectionScreenState createState() => _LabSelectionScreenState();
}

class _LabSelectionScreenState extends State<LabSelectionScreen>
    with SingleTickerProviderStateMixin {
  List<String> title = ["Map", "Select Lab"];
  int selectedIndex = 1;
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 1, length: 2, vsync: this);
    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
        // _controller.animateTo(0); to move any screen
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title[selectedIndex],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ).tr(),
          bottom: TabBar(
            controller: _controller,
            indicatorColor: color,
            labelColor: color,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            tabs: [
              Tab(
                text: "Map".tr(),
              ),
              Tab(text: "List".tr()),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            MapScreen(),
            SelectLabScreen(
              testType: widget.testType,
            ),
          ],
        ));
  }
}
