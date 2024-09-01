import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/size.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
      this.showAction =false,
      this.onActionPress});

  final String text;
  final String animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPress;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,width:MediaQuery.of(context).size.width*0.8),
          const SizedBox(height: TSizes.defaultSpace,),
          Text(text,style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace,),
          showAction ?SizedBox(
            width: 250,
            child: OutlinedButton(onPressed: onActionPress, 
            style: OutlinedButton.styleFrom(backgroundColor: Tcolors.dark),
            child: Text(actionText!,style: Theme.of(context).textTheme.bodyMedium!.apply(color: Tcolors.light),)),
          )
          :const SizedBox(),
        ],
      ),
    );
  }
}
