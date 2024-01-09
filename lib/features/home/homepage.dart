import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/providers/user_provider.dart';
import 'package:ruth_and_jerry/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State <HomeScreen> createState() => _HomeScreenState();
}

class  _HomeScreenState extends State <HomeScreen> {
  @override
  Widget build(BuildContext context) {
   final user = Provider.of<UserProvider>(context, listen: user_provider).user;
    return Scaffold(
      body: Center (child:Text(user.toJson()),),
    );
  }

  void get user_provider => null;
}