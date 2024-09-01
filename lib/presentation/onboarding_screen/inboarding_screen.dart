// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/application/home_bloc/home_bloc.dart';
import 'package:to_do/domain/repositary/shered_preference.dart';
import 'package:to_do/presentation/home_screen/home_screen.dart';

import 'widgets/on_boarding_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        onFinish: ()async{
          //setting the shared prefs 
          await SharedPref.setOnboardingStatus();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) {
            return BlocProvider(
              create: (context) => HomeBloc(),
              child: const HomeScreen(),
            );
          }), (route) => false);
        },
        finishButtonText: 'Get Started',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Colors.red
        ),
        centerBackground: true,
        totalPage: 3, 
        headerBackgroundColor: Colors.white, 
        background: [
          Center(child: Lottie.asset('assets/lottie/onboarding1.json')),
          Center(child: Lottie.asset('assets/lottie/onboarding2.json')),
          Center(child: Lottie.asset('assets/lottie/onboarding3.json')),
        ], 
        speed: 1.8, 
        pageBodies: const [
          OnBoardingText(text: 'Make a List of tasks that you have to finish',),
          OnBoardingText(text: 'add the task to the app and get remained ',),
          OnBoardingText(text: "what are you waiting for let's get started",),
        ]),
    );
  }
}
