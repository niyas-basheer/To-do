import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/signin.dart';

import 'package:to_do_app/sign/signin.dart';
import 'package:to_do_app/widgets/widgets_common.dart';


class SignUpWidgets extends StatefulWidget {
  @override
  _SignUpWidgetsState createState() => _SignUpWidgetsState();
}

class _SignUpWidgetsState extends State<SignUpWidgets> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool isObscure = true;

 @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }


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
               buildHeader(),
              buildUsernameTextField(context),
              buildEmailTextField(context),
              buildPasswordTextField(context),
              buildNewPasswordTextField(context),
              buildSignUpButton(context),
              buildSignInButton(context),
              ],
            ),
    );
  }


  Widget buildUsernameTextField(BuildContext context) {
    return 
    buildTextField(
      context: context,
      labelText: "username",
      controller: usernameController,
      hintText: "Enter your username",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a username';
        } else if (!RegExp(r'^[A-Z][A-Za-z\s]*$').hasMatch(value)) {
          return 'Invalid username format';
        }
        return null;
      },
    );
  }

  Widget buildEmailTextField(BuildContext context) {
    return buildTextField(
      context: context,
      labelText: "email", 
      controller: emailController,
      hintText: "Enter your email",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email address';
        } else if (!RegExp(
                r'^[A-Za-z][A-Za-z0-9._%+-]*@(gmail\.com|outlook\.com|company\.com|AOL\.com| hotmail\.com|yahoo\.com)$')
            .hasMatch(value)) {
          return 'Invalid email format or domain';
        }
        return null;
      },
      
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return buildTextField(
      context: context,
      labelText: "Password",
      controller: passwordController,
      hintText: "Enter your password",
      obscureText: isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a new password';
        }

        // Check for capital letter at the beginning
        if (!RegExp(r'^[A-Z]').hasMatch(value)) {
          return 'Password must start with a capital letter';
        }

        // Check for at least one special character
        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return 'Password must contain at least one special character';
        }

        // Check for minimum length of 6 characters
        if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }

        // Check for at least one number
        if (!RegExp(r'\d').hasMatch(value)) {
          return 'Password must contain at least one number';
        }
        return null;
      },
       suffixIcon: GestureDetector(
    onTap: () {
      setState(() {
        isObscure = !isObscure;
      });
    },
    child: Icon(
      isObscure ? Icons.visibility : Icons.visibility_off,
    ),
    )
    );
  }

  Widget buildNewPasswordTextField(BuildContext context) {
    return buildTextField(
      context: context,
      labelText: "Confirm Password",
      controller: newPasswordController,
      hintText: "Confirm Password",
      obscureText: isObscure,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please confirm your new password';
        } else if (value != newPasswordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      suffixIcon: GestureDetector(
    onTap: () {
      setState(() {
        isObscure = !isObscure;
      });
    },
    child: Icon(
      isObscure ? Icons.visibility : Icons.visibility_off,
    ),
    )
    );
  }

  Widget buildSignUpButton(BuildContext context) {
    return buildElevatedButton(
      context: context,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final username = usernameController.text;
          final email = emailController.text;
          final password = passwordController.text;
          saveSignupDetails(username, email, password);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
          );
        }
      },
      text: "Sign Up",
    );
  }

  void saveSignupDetails(String username, String email, String password) async {
  final signupBox = await Hive.openBox<UserModel>('users');
  final signupDetails = UserModel(username: '', email: '', password: '')
    ..username = username
    ..email = email
    ..password = password;
  await signupBox.put('users', signupDetails);
}

Widget buildSignInButton(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Already have an account?",
        style: TextStyle(
          fontSize: 16,
          color: splachcolor,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const SignIn(),
          ));
        },
        child: const Text(
          "Sign In",
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
              buildUsernameTextField(context),
              buildEmailTextField(context),
              buildPasswordTextField(context),
              buildNewPasswordTextField(context),
              buildSignUpButton(context),
              buildSignInButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

 


}
