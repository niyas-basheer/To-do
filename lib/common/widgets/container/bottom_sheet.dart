// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/container/bottom_sheet_button.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';
import 'package:to_do/utils/constants/colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final int isCompleted;
  final Task task;

  const CustomBottomSheet({
    super.key,
    required this.isCompleted,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      height:  MediaQuery.of(context).size.height * 0.32,
       
      child: Column(
        children: [
          const Spacer(),
          isCompleted == 1
              ? BottomSheetButton(
                  label: 'Task inComplete',
                  ontap: () async {
                    
                    task.isCompleted = 0;
                    await task.save();
                    
                    Navigator.pop(context); 
                  },
                  clr: Tcolors.primary,
                )
              : BottomSheetButton(
                  label: 'Task Completed',
                  ontap: () async {
                    
                    task.isCompleted = 1;
                    await task.save();
                    
                    Navigator.pop(context); 
                  },
                  clr: Tcolors.primary,
                ),
          BottomSheetButton(
            label: 'Delete task',
            ontap: () async {
              await task.delete();
              Navigator.pop(context);
            },
            clr: Colors.red[300]!,
          ),
          const SizedBox(height: 20),
          BottomSheetButton(
            label: 'Close',
            ontap: () {
              Navigator.pop(context);
            },
            clr: Colors.white,
            isClose: true,
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
