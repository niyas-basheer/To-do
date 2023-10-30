import 'package:flutter/material.dart';

import 'dart:async';

import 'package:to_do_app/splash/secondspalsh.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const SecondScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/urgent-bro-TEZ.png",
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
