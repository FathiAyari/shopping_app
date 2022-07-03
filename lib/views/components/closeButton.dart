import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants.dart';

Container closeButton() {
  return Container(
    width: double.infinity,
    height: Constants.screenHeight * 0.08,
    child: Row(
      children: [
        InkResponse(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/cross-circle.png',
              width: 30,
              height: 30,
            ),
          ),
          onTap: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}
