import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController passwordController;
  const PasswordField({Key? key, required this.label, required this.passwordController}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "${widget.label}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffa39f9f), fontSize: Constants.screenHeight * 0.018),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return " this field is required";
              }
            },
            controller: widget.passwordController,
            obscureText: obscureText,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: obscureText
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Color(0xffa0c4f6),
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.black12,
                        ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
          ),
        ],
      ),
    );
  }
}
