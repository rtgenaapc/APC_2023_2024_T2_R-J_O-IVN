import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:ruth_and_jerry/constants/global_variable.dart';
import 'package:ruth_and_jerry/reusableWidgets/custom_bttn.dart';
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
    print('Sign in logic goes here');
  }

  void navigateToSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Login',
              style: TextStyle(
                fontSize: 22,
              ),
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
                    CustomBttn(text: 'Sign in', onTap: handleSignIn),
                    const SizedBox(height: 10),
                    // Register button to navigate to SignUpScreen
                    CustomBttn(
                      onTap: navigateToSignUpScreen,
                      text: 'Register',
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
