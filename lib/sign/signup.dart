
import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/widgets_signup.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpWidgets signUpWidgets = SignUpWidgets();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: _buildTaskList( context)
      ),
    );
  }
   Widget _buildTaskList(BuildContext context) {
    return SignUpWidgets();
  }
}