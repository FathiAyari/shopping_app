import 'package:aicha/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/action_button.dart';

class StartShoppingScreen extends StatefulWidget {
  const StartShoppingScreen({Key? key}) : super(key: key);

  @override
  _StartShoppingScreenState createState() => _StartShoppingScreenState();
}

class _StartShoppingScreenState extends State<StartShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: new Radius.elliptical(200, 120)), color: Color(0xffa0c4f6)),
              height: Constants.screenHeight * 0.67,
              child: Image.asset(
                "assets/images/mg.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Constants.screenHeight * 0.06, bottom: Constants.screenHeight * 0.01),
              child: Text(
                "MG NO GASP",
                style: TextStyle(fontSize: Constants.screenHeight * 0.03, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Find everything you need here",
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffa39f9f), fontSize: Constants.screenHeight * 0.018),
            ),
            buildActionButton("Start shopping", () {
              Get.toNamed("/login");
            })
          ],
        ),
      ),
    ));
  }
}
