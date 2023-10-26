// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:to_do_app/color.dart';
// import 'package:to_do_app/database/signin.dart';

// import 'package:to_do_app/sign/signin.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   bool _isObscure = true;
//   void _saveSignupDetails(
//       String username, String email, String password) async {
//     final signupBox = await Hive.openBox<UserModel>('users');
//     final signupDetails = UserModel(username: '', email: '', password: '')
//       ..username = username
//       ..email = email
//       ..password = password;
//     await signupBox.put('users', signupDetails);
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Image.asset(
//                   "assets/images/urgent-bro-TEZ.png",
//                   width: 100,
//                   height: 100,
//                 ),
//               ),
//               const Text(
//                 "Welcome!",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: blackcolor,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Username",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: secondaryColor,
//                         ),
//                       ),
//                     ),
//                     TextFormField(
//                       style: const TextStyle(
//                         color: blackcolor,
//                       ),
//                       controller: _usernameController,
//                       validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a username';
//                           } else if (!RegExp(r'^[A-Z][A-Za-z\s]*$')
//                               .hasMatch(value)) {
//                             return 'Invalid username format';
//                           }
//                           return null;
//                         },
//                       decoration: const InputDecoration(
//                         hintText: "Enter your username",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Email",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: secondaryColor,
//                         ),
//                       ),
//                     ),
//                     TextFormField(
//                       style: const TextStyle(
//                         color: blackcolor,
//                       ),
//                       controller: _emailController,
//                       validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter an email address';
//                           } else if (!RegExp(
//                                   r'^[A-Za-z][A-Za-z0-9._%+-]*@(gmail\.com|outlook\.com|company\.com)$')
//                               .hasMatch(value)) {
//                             return 'Invalid email format or domain';
//                           }
//                           return null;
//                         },
//                       decoration: const InputDecoration(
//                         hintText: "Enter your email",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Password",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: secondaryColor,
//                         ),
//                       ),
//                     ),
//                     TextFormField(
//                       style: const TextStyle(
//                         color: blackcolor,
//                       ),
//                       controller: _passwordController,
//                       obscureText:  _isObscure,
//                       validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a new password';
//                           }

//                           // Check for capital letter at the beginning
//                           if (!RegExp(r'^[A-Z]').hasMatch(value)) {
//                             return 'Password must start with a capital letter';
//                           }

//                           // Check for at least one special character
//                           if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
//                               .hasMatch(value)) {
//                             return 'Password must contain at least one special character';
//                           }

//                           // Check for minimum length of 6 characters
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters long';
//                           }

//                           // Check for at least one number
//                           if (!RegExp(r'\d').hasMatch(value)) {
//                             return 'Password must contain at least one number';
//                           }
//                           return null;
//                         },
//                       decoration:  InputDecoration(
//                         suffixIcon: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _isObscure = !_isObscure;
//                               });
//                             },
//                             child: Icon(
//                               _isObscure
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                           ),
//                         hintText: "Enter your password",
//                         border: const OutlineInputBorder(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//                Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Confirm Password',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: secondaryColor,
//                         ),
//                       ),
//                     ),
//                     TextFormField(
//                       style: const TextStyle(
//                         color: blackcolor,
//                       ),
//                       controller: _newPasswordController,
//                       obscureText: _isObscure,
//                       validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please confirm your new password';
//                           } else if (value != _newPasswordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       decoration:  InputDecoration(
//                         suffixIcon: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 _isObscure = !_isObscure;
//                               });
//                             },
//                             child: Icon(
//                               _isObscure
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                           ),
//                         hintText: "Enter your password",
//                         border: const OutlineInputBorder(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 0.9 * MediaQuery.of(context).size.width,
//                 height: 60,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         final username = _usernameController.text;
//                         final email = _emailController.text;
//                         final password = _passwordController.text;
//                         _saveSignupDetails(username, email, password);
//                        Navigator.of(context).pushReplacement(
//                             MaterialPageRoute(
//                               builder: (context) => const SignIn(),
//                             ),
//                           );
//                       }
//                     },
//                   style: ElevatedButton.styleFrom(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(0)),
//                     ),
//                     backgroundColor: secondaryColor,
//                     alignment: Alignment.center,
//                   ),
//                   child: const Text(
//                     "Sign Up",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: blackcolor,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 "Already have an account?",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: splachcolor,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (BuildContext context) => const SignIn(),
//                   ));
//                 },
//                 child: const Text(
//                   "Sign In",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: secondaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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