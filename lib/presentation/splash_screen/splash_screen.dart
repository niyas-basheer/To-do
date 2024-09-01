

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_bloc.dart';
import 'package:to_do/application/splash_bloc/splash_bloc.dart';
import 'package:to_do/application/splash_bloc/splash_state.dart';
import 'package:to_do/common/widgets/common_cetogery/bottom_navigation_bar.dart';
import 'package:to_do/domain/repositary/shered_preference.dart';
import 'package:to_do/presentation/onboarding_screen/inboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) async{
        if (state is SplashLoadedState) {
          if(await SharedPref.checkOnBoardingStatus()==false){
           Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (ctx) {
            return BlocProvider(
              create: (context) => NavigationBloc(),
              child: const CustomBottomNavigationBar(),
            );
          }), (route) => false);
          }else{
             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const OnboardingScreen()));
            
          }
        } 
      },
      child: Scaffold(
        body: Get.isDarkMode? Center(child: Image.asset('assets/icons/splash_light.gif')):Center(child: Image.asset('assets/icons/splash_dark.gif')),
      ),
    );
  }
}