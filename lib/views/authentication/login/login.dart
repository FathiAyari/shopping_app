import 'dart:io';

import 'package:aicha/constants/constants.dart';
import 'package:aicha/models/Users.dart';
import 'package:aicha/views/components/input_field.dart';
import 'package:aicha/views/components/password_field.dart';
import 'package:aicha/views/onboarding/on_boarding_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ndialog/ndialog.dart';

import '../../../services/AuthServices.dart';
import '../../components/action_button.dart';
import '../../components/alert_widgets.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  OnBoardingController controller = OnBoardingController();
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
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                alignment: Alignment.topCenter,
                color: Color(0xffa0c4f6),
                child: Padding(
                  padding: EdgeInsets.only(top: Constants.screenHeight * 0.08),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
                margin: EdgeInsets.only(top: Constants.screenHeight * 0.15),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Constants.screenHeight * 0.09,
                          ),
                          inputField("Email", TextInputType.emailAddress, emailController),
                          PasswordField(label: "Password", passwordController: passwordController),
                          Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: Constants.screenHeight * 0.02,
                                      top: Constants.screenHeight * 0.02,
                                      right: Constants.screenWidth * 0.04),
                                  child: TextButton(
                                      onPressed: () {
                                        Get.toNamed('/forgot_password');
                                      },
                                      child: Text(
                                        "Frogot password ?",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      )))),
                          loading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                )
                              : buildActionButton("Login", () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    AuthServices().signIn(emailController.text, passwordController.text).then((value) async {
                                      if (value) {
                                        final FirebaseAuth auth = await FirebaseAuth.instance;
                                        final User? user = await auth.currentUser;
                                        final uid = user!.uid;
                                        var UserData = await FirebaseFirestore.instance.collection('users').doc(uid).get();
                                        Cusers currentUser = Cusers.fromJson(UserData.data() as Map<String, dynamic>);
                                        controller.saveUser(currentUser);
                                        Get.toNamed("/home");
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: "Invalid cridentials",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    });
                                  }
                                }),
                          SizedBox(
                            height: Constants.screenHeight * 0.03,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextButton(
                                    child: Text("Besoin d'un nouveau compte?",
                                        style: TextStyle(color: Color(0xffa0c4f6), fontSize: 14, fontStyle: FontStyle.italic)),
                                    onPressed: () {
                                      Get.toNamed("/register");
                                    },
                                  ))
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
