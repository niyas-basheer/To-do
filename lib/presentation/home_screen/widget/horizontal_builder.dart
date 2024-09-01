import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/application/home_bloc/home_bloc.dart';
import 'package:to_do/application/home_bloc/home_state.dart';
import 'package:to_do/common/widgets/container/bottom_sheet.dart';
import 'package:to_do/common/widgets/container/tasktile.dart';



class HorizontalBuilder extends StatelessWidget {
  const HorizontalBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskEmpty) {
          return Center(child: Lottie.asset('assets/images/no data found.json'));
        } else if (state is TaskLoaded) {
          final completedTasks = state.tasks.where((task) => task.isCompleted == 1).toList();

          return SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];
                

                return  AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                child: FadeInAnimation(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TaskTile(task,width: true,),
                    ),
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
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}
