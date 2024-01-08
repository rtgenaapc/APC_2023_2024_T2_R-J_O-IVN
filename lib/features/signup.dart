// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:ruth_and_jerry/features/login.dart';
import 'package:ruth_and_jerry/reusableWidgets/custom_bttn.dart';
import 'package:ruth_and_jerry/reusableWidgets/custom_textField.dart';
import 'package:ruth_and_jerry/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final auth_Service authService = auth_Service();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpUser() {
    authService.signUpUser(
      context: context,
      User_Email: _emailController.text,
      User_Password: _passwordController.text,
      User_Name: _nameController.text,
    );
  }

  void signinUser() {
    authService.signinUser(
      context: context,
      User_Email: _emailController.text,
      User_Password: _passwordController.text,
    );
  }

  void navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
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
            const Text(
              'Sign-Up',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(height: 10),
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
                    CustomBttn(
                        text: 'SIGN UP',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: const Text(
                                    'Please fix the errors in the form.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }),
                    const SizedBox(height: 10),
                    CustomBttn(
                      text: 'Already have an account?',
                      onTap: navigateToLoginScreen,
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
