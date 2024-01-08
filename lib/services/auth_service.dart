// ignore_for_file: camel_case_types, non_constant_identifier_names, use_build_context_synchronously, avoid_print, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/constants/errorHandling.dart';
import 'package:ruth_and_jerry/constants/global_variable.dart';
import 'package:ruth_and_jerry/constants/utility.dart';
import 'package:ruth_and_jerry/features/home/homepage.dart';
import 'package:ruth_and_jerry/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:ruth_and_jerry/providers/user_provider.dart';

class auth_Service {
  void signUpUser({
    required BuildContext context,
    required String User_Email,
    required String User_Password,
    required String User_Name,
  }) async {
    try {
      users user = users(
        User_Id: '',
        User_Name: User_Name,
        User_Password: User_Password,
        User_Email: User_Email,
        User_Address: '',
        User_Type: '',
        User_Token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF',
        },
      );
      httpErrHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Successfully registered. ',
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //login

  void loginUser({
    required BuildContext context,
    required String User_Email,
    required String User_Password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: jsonEncode({
          'User_Email': User_Email,
          'User_Password': User_Password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF',
        },
      );
      print(res.body);
      httpErrHandling(
          response: res,
          context: context,
          onSuccess: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            Provider.of(context, listen: false).setUser(res.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
              Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false,);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

class Provider {
  static of(BuildContext context, {required bool listen}) {}
}

mixin SharedPreferences {
  static getInstance() {}
  setString(String s, jsonDecode) {}
}
