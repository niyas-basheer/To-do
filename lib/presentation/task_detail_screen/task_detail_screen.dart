import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailScreen extends StatelessWidget {
  final String? labal;
  const TaskDetailScreen({required this.labal,super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
      title: Text(labal.toString().split("|")[0],style: Theme.of(context).textTheme.headlineMedium,),
     ),
     body: Center(
       child: Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Get.isDarkMode?Colors.white:Colors.grey[400]
        ),
        child: Center(child: Text(labal.toString().split("|")[1],style: Theme.of(context).textTheme.headlineMedium,)),
       ),
     ),
    );
  }
}