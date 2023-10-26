// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:to_do_app/database/signin.dart';
import 'package:to_do_app/home/home.dart';
import 'package:to_do_app/sign/signup.dart';

class SignInWidgets extends StatefulWidget {
  const SignInWidgets({super.key});

  // Create a getter for the formKey
  // ignore: recursive_getters
  GlobalKey<FormState> get formKey => formKey;

  @override
  // ignore: library_private_types_in_public_api
  _SignInWidgetsState createState() => _SignInWidgetsState();
}

class _SignInWidgetsState extends State<SignInWidgets> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  Widget buildHeader() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 50),
          child: Image.asset(
            "assets/images/urgent-bro-TEZ.png",
            width: 100,
            height: 100,
          ),
        ),
        const Text(
          "Welcome!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: blackcolor,
          ),
        ),
      ],
    );
  }

 Widget _buildTaskList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
              children: [
                buildHeader(),  // Corrected
                buildEmailTextField(),  // Corrected
                buildPasswordTextField(context),  // Corrected
                buildLoginButton(context),  // Corrected
                buildSignUpButton(context),  // Corrected
              ],
            ),
    );
  }

  Widget buildEmailTextField() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email",
            style: TextStyle(
              fontSize: 16,
              color: splachcolor,
            ),
          ),
        ),
        TextFormField(
          style: const TextStyle(
            color: blackcolor,
          ),
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter email';
            } else if (!RegExp(
                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
              return 'Invalid email format';
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: "Enter your email",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}


  Widget buildPasswordTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                color: splachcolor,
              ),
            ),
          ),
          TextFormField(
            style: const TextStyle(
              color: blackcolor,
            ),
            controller: passwordController,
            obscureText: isObscure,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              hintText: "Enter your password",
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: 0.9 * MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            final email = emailController.text;
            final password = passwordController.text;

            final signupBox = await Hive.openBox<UserModel>('users');
            final signupDetails = signupBox.get('users',
                defaultValue: UserModel(
                    username: '', email: '', password: ''));

            if (signupDetails != null &&
                signupDetails.email == email &&
                signupDetails.password == password) {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(
                    child: Text('Welcome to Home page'),
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invalid email or password'),
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          backgroundColor: secondaryColor,
          alignment: Alignment.center,
        ),
        child: const Text(
          "Log In",
          style: TextStyle(
            fontSize: 16,
            color: blackcolor,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 16,
            color: splachcolor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const SignUp(),
              ),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 16,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildHeader(),
                buildEmailTextField(),
                buildPasswordTextField(context),
                buildLoginButton(context),
                buildSignUpButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
