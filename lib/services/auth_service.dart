import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/constants/errorHandling.dart';
import 'package:ruth_and_jerry/constants/global_variable.dart';
import 'package:ruth_and_jerry/constants/utility.dart';
import 'package:ruth_and_jerry/model/user.dart';
import 'package:http/http.dart' as http;

class auth_Service {
  void signUpUser ({
    required BuildContext context,
    required String User_Email,
    required String User_Password,
    required String User_Name,

  }) async{
    try {
      users user= users(
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
    httpErrHandling(response: res,
    context: context,
    onSuccess: (){
      showSnackBar(context,
      'Successfully registered. ',
      );
    });
    } catch (e) {
      showSnackBar(context,
      e.toString());
    }
  }
}