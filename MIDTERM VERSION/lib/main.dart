
import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/constants/global_variable.dart';
import 'package:ruth_and_jerry/features/login.dart';
import 'package:ruth_and_jerry/route.dart';

void main() {
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruth And Jerry',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVar.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVar.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LoginScreen(), //UIs should be form type, not radiobutton
    );
  }
}
