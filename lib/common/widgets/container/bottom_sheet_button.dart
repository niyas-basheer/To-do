

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';



class BottomSheetButton extends StatelessWidget {
  final String label;
  final Function()? ontap;
  final Color clr;
  bool isClose ;
   BottomSheetButton({super.key, required this.label, required this.ontap, required this.clr, this.isClose=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(onPressed:ontap ,
      child:SizedBox(width: double.infinity,child: Center(child: Text(label,style: Theme.of(context).textTheme.headlineSmall,)))),
    );
  }
}