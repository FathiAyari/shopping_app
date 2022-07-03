import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Positive(VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xfff563a2),
      ),
      child: Container(
        height: 20,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              "${"Yes"}",
              style: TextStyle(
                fontFamily: "NunitoBold",
                color: Color(0xffEAEDEF),
              ),
            )),
      ),
    ),
  );
}

Widget Negative() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff3dc295),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "No",
              style: TextStyle(
                fontFamily: "NunitoBold",
                color: Color(0xffEAEDEF),
              ),
            )),
      ),
    );
  });
}
