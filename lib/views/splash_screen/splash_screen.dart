import 'dart:async';

import 'package:aicha/constants/constants.dart';
import 'package:aicha/views/authentication/login/login.dart';
import 'package:aicha/views/onboarding/on_boarding_page.dart';
import 'package:aicha/views/profile/home_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplashScreen> {
  var seen = GetStorage().read("seen");
  var auth = GetStorage().read("auth");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () => Get.to(seen == 1 ? (auth == 1 ? HomePageContent() : Login()) : OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: Constants.screenHeight * 0.2,
            ),
            Lottie.asset(
              "assets/images/hello.json",
              height: Constants.screenHeight * 0.2,
            ),
            SizedBox(
              height: Constants.screenHeight * 0.1,
            ),
            Container(
              width: double.infinity,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Mg No Gasp",
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 40,
                      fontFamily: 'NunitoBold',
                    ),
                    speed: Duration(milliseconds: 40),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Constants.screenHeight * 0.06,
            ),
            Lottie.asset(
              "assets/images/test.json",
              height: size.height * 0.2,
            ),
            Lottie.asset(
              "assets/images/loading.json",
              height: size.height * 0.09,
            )
          ],
        ));
  }
}
