

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/application/home_bloc/home_bloc.dart';
import 'package:to_do/application/home_bloc/home_state.dart';
import 'package:to_do/presentation/home_screen/widget/incomplited_task.dart';

class VerticalBuilder extends StatelessWidget {
  const VerticalBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskEmpty) {
          return Center(child: Lottie.asset('assets/images/no data found.json'));
        } else if (state is TaskLoaded) {
          final inCompletedTasks = state.tasks.where((task) => task.isCompleted == 0).toList();

          return InComplitedTask(tasks: inCompletedTasks);
        } else {
          return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }
}

