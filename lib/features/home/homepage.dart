import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/providers/user_provider.dart';
import 'package:ruth_and_jerry/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
   final user = Provider.of<UserProvider>(context, listen: user_provider).user;
=======
    final user = Provider.of<UserProvider>(context).user;
>>>>>>> 11cdff9da0b9084aae5866c31d94658605347322
    return Scaffold(
      body: Center(
        child: Text(user.toJson()),
      ),
    );
  }
<<<<<<< HEAD

  void get user_provider => null;
}
=======
}
>>>>>>> 11cdff9da0b9084aae5866c31d94658605347322
