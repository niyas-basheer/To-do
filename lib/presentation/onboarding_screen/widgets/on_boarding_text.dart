// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class OnBoardingText extends StatelessWidget {
  final String text;
  const OnBoardingText({
    super.key, required this.text,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child:  Column(
        children: <Widget>[
          const SizedBox(
            height: 480,
          ),
          Text(text,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}