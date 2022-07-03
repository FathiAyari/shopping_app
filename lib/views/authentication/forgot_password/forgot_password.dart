import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants.dart';
import '../../../services/AuthServices.dart';
import '../../components/action_button.dart';
import '../../components/input_field.dart';
import '../login/login.dart';

class FrogotPassword extends StatefulWidget {
  const FrogotPassword({Key? key}) : super(key: key);

  @override
  _FrogotPasswordState createState() => _FrogotPasswordState();
}

class _FrogotPasswordState extends State<FrogotPassword> {
  TextEditingController emailController = TextEditingController();
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa0c4f6),
        elevation: 0,
      ),
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
                  "Reset password",
                  style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
              margin: EdgeInsets.only(top: Constants.screenHeight * 0.15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: Constants.screenHeight * 0.09,
                    ),
                    Form(key: _formKey, child: inputField("Email", TextInputType.emailAddress, emailController)),
                    loading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : buildActionButton("Reset", () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              AuthServices().resetPassword(emailController.text).then((value) {
                                setState(() {
                                  loading = false;
                                  Get.offAll(Login());
                                });
                                if (value) {
                                  Fluttertoast.showToast(
                                      msg: "Reset password link has been sent ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "No account with the given email",
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
