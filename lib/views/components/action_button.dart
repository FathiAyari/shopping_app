import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

Padding buildActionButton(String label, VoidCallback press) {
  return Padding(
    padding: EdgeInsets.only(
        top: Constants.screenHeight * 0.03, right: Constants.screenWidth * 0.03, left: Constants.screenWidth * 0.03),
    child: Container(
      width: double.infinity,
      height: Constants.screenHeight * 0.06,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), primary: Color(0xffa0c4f6)),
          onPressed: press,
          child: Text("$label")),
    ),
  );
}
