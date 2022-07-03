import 'package:aicha/views/authentication/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants.dart';
import '../../../services/AuthServices.dart';
import '../../components/action_button.dart';
import '../../components/input_field.dart';
import '../../components/password_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa0c4f6),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          fit: StackFit.expand,
          children: [
            Container(
              alignment: Alignment.topCenter,
              color: Color(0xffa0c4f6),
              child: Padding(
                padding: EdgeInsets.only(top: Constants.screenHeight * 0.08),
                child: Text(
                  "Créer un compte",
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
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Constants.screenHeight * 0.09,
                        ),
                        inputField("Nom et prénom", TextInputType.emailAddress, nameController),
                        inputField("Email", TextInputType.emailAddress, emailController),
                        inputField("Numéero de portable", TextInputType.number, phoneController),
                        PasswordField(label: "Mot de passe", passwordController: passwordController),
                        loading
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              )
                            : buildActionButton("Créer un compte", () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  AuthServices()
                                      .signUp(nameController.text, emailController.text, passwordController.text,
                                          phoneController.text)
                                      .then((value) {
                                    if (value) {
                                      setState(() {
                                        loading = false;
                                      });
                                      Get.offAll(Login());
                                    } else {
                                      setState(() {
                                        loading = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg: "Utilisateur déja existe",
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
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
