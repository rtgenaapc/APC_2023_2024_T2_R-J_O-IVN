import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/model/user.dart';

class UserProvider extends ChangeNotifier {
  users _user = users(
    User_Id: '',
    User_Name: '',
    User_Password: '',
    User_Email: '',
    User_Address: '',
    User_Type: '',
    User_Token: '',
  );

  users get user => _user;
  void setUser(String user) {
    _user = users.fromJson(user);
    notifyListeners();
  }
}
