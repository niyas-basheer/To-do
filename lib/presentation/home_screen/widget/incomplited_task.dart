import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/common/widgets/container/bottom_sheet.dart';
import 'package:to_do/common/widgets/container/tasktile.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';

class InComplitedTask extends StatelessWidget {
  const InComplitedTask({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 550, maxHeight: 560),
      child: tasks.isEmpty ? Lottie.asset('assets/images/no data found.json'):
      ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.transparent,
          thickness: 10,
        ),
        itemBuilder: (context, index) {
         final task = tasks[index];

          return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: GestureDetector(
                    child: TaskTile(task),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            child: CustomBottomSheet(
                              isCompleted: task.isCompleted,
                              task: task,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ));
        },
      ),
    );
  }
}
