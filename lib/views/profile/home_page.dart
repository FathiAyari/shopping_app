import 'dart:io';

import 'package:aicha/views/profile/pages/basket_page.dart';
import 'package:aicha/views/profile/pages/map_page.dart';
import 'package:aicha/views/profile/pages/profile_page.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import '../../constants/constants.dart';
import '../components/alert_widgets.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int currentPageIndex = 0;
  List pages = [BasketScreen(), MapScreen(), ProfileScreen()];
  Future<bool> avoidReturnButton() async {
    NAlertDialog(
      title: Column(
        children: [
          Image.asset("assets/images/dexclamation.png", height: Constants.screenHeight * 0.06, color: Colors.red),
          Text(
            "Do you want to quit ?",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "NunitoBold",
            ),
          ),
        ],
      ),
      actions: [
        Negative(),
        Positive(() {
          exit(0);
        })
      ],
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: avoidReturnButton,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(child: Container(child: pages[currentPageIndex])),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Constants.screenHeight * 0.02),
              child: Container(
                width: double.infinity,
                height: Constants.screenHeight * 0.07,
                child: Container(
                  color: Colors.transparent,
                  child: CustomNavigationBar(
                    strokeColor: Color(0xff04BF20),
                    items: [
                      CustomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/basket.png'),
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage('assets/images/map.png'),
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: const ImageIcon(
                          AssetImage('assets/images/profil.png'),
                        ),
                      ),
                    ],
                    iconSize: 30,
                    selectedColor: Colors.blueAccent,
                    unSelectedColor: Colors.redAccent,
                    currentIndex: currentPageIndex,
                    borderRadius: Radius.circular(20),
                    isFloating: true,
                    backgroundColor: Colors.white,
                    onTap: (index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
