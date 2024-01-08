import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/reusableWidgets/custom_bttn.dart';
import 'signup.dart';
// ignore: unused_import
import 'package:ruth_and_jerry/constants/global_variable.dart';
import 'package:ruth_and_jerry/reusableWidgets/custom_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void handleSignIn() {
    // Implement your sign-in logic here
    // ignore: avoid_print
    print('Sign in logic goes here');
  }

  void navigateToSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 84, 234, 84),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/features/assets/OMG_LOGO.png'),
            // Other widgets...
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Lets get you started.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _signInFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    CustomBttn(text: 'LOG IN', onTap: handleSignIn),
                    const SizedBox(height: 10),
                    // SIGN UP button to navigate to SignUpScreen
                    CustomBttn(
                      onTap: navigateToSignUpScreen,
                      text: 'SIGN UP',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
