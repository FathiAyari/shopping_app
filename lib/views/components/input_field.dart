import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

Widget inputField(String label, TextInputType textInputType, TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "$label",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffa39f9f), fontSize: Constants.screenHeight * 0.018),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return " cet camp est obligatoire";
            } else if (label == "Email") {
              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
              if (!emailValid) {
                return " Format incorrecte d'email ";
              }
            }
          },
          keyboardType: textInputType,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
      ],
    ),
  );
}
