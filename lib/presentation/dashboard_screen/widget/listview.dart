

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/application/dashboard_bloc/dashboard_bloc.dart';
import 'package:to_do/application/dashboard_bloc/dashboard_state.dart';
import 'package:to_do/presentation/home_screen/widget/incomplited_task.dart';

class ListviewBuilder extends StatelessWidget {
  const ListviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
       
         if (state.tasks.isEmpty) {
          final inCompletedTasks = state.tasks;
          return InComplitedTask(tasks: inCompletedTasks);
        } else {
          return Center(child: Lottie.asset('assets/images/no data found.json'));
        }
      },
    );
  }
}

