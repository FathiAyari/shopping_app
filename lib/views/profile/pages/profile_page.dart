import 'package:aicha/views/onboarding/on_boarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:ndialog/ndialog.dart';

import '../../../constants/constants.dart';
import '../../components/alert_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  OnBoardingController controller = OnBoardingController();
  bool isVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (this.mounted) {
        setState(() {
          isVisible = false;
        });
      }
    });
  }

  var user = GetStorage().read("user");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfff1f5f6),
      body: Column(
        children: [
          Container(
            height: Constants.screenHeight * 0.4,
            decoration: BoxDecoration(
                color: Color(0xff009167).withOpacity(0.5),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(110), bottomRight: Radius.circular(0), bottomLeft: Radius.circular(110))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        height: Constants.screenHeight * 0.08,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/avatar.png"),
                        ),
                      ),
                    ),
                    Container(
                      height: Constants.screenHeight * 0.15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: Constants.screenHeight * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bienvenue de nauveau",
                                    style: TextStyle(
                                        fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.03, color: Colors.white),
                                  ),
                                  Text(
                                    "${user["name"]}",
                                    style: TextStyle(
                                        fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.02, color: Colors.white),
                                  ),
                                  Text(
                                    "${user["email"]}",
                                    style: TextStyle(
                                        fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.02, color: Colors.white),
                                  ),
                                  Text(
                                    "+216 ${user["gsm"]}",
                                    style: TextStyle(
                                        fontFamily: "NunitoBold", fontSize: Constants.screenHeight * 0.02, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Visibility(
                                visible: isVisible,
                                child: Container(
                                  child: Lottie.asset("assets/images/greeting.json",
                                      repeat: false, height: Constants.screenHeight * 0.2, width: Constants.screenWidth * 0.2),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Constants.screenHeight * 0.1,
          ),
          InkWell(
            onTap: () {
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
                    controller.logOut();
                  })
                ],
                blur: 2,
              ).show(context, transitionType: DialogTransitionType.Bubble);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Constants.screenWidth * 0.06, vertical: Constants.screenHeight * 0.01),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                height: Constants.screenHeight * 0.1,
                child: ListTile(
                  title: Row(
                    children: [
                      Container(
                        height: Constants.screenHeight * 0.06,
                        decoration:
                            BoxDecoration(color: Color(0xfff563a2).withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/logout.png",
                            color: Color(0xfff563a2),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Deconnecter",
                          style: TextStyle(
                              /*    color: Color(0xff5686E1),*/
                              fontFamily: "NunitoBold",
                              color: Color(0xfff563a2),
                              fontSize: Constants.screenHeight * 0.02),
                        ),
                      )
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfff563a2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
