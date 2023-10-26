import 'package:flutter/material.dart';
import '../widgets/wigdets_signin.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final SignInWidgets signInWidgets = SignInWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildTaskList(context),
      ),
    );
  }

  Widget _buildTaskList(BuildContext context) {
    return const SignInWidgets();
  }
}
