import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({Key? key,
  required this.controller,
  required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon? prefixIcon;
    EdgeInsetsGeometry contentPadding;

    if (hintText == 'Email') {
      prefixIcon = Icon(Icons.email);
    } else if (hintText == 'Password') {
      prefixIcon = Icon(Icons.security_sharp);
    }
    else if (hintText == 'Name/Username') {
      prefixIcon = Icon(Icons.account_circle);
    }

    contentPadding = const EdgeInsets.symmetric(
      vertical: 12.0,
    horizontal: 16.0);

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        contentPadding: contentPadding,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.
          fromARGB(96, 216, 159, 159)),
        ),
      ),
      validator: (val) {
        if(val == null|| val.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
