import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do/application/add_item_bloc/add_item_bloc.dart';
import 'package:to_do/application/add_item_bloc/add_item_state.dart';
import 'package:to_do/application/home_bloc/home_bloc.dart';
import 'package:to_do/application/home_bloc/home_event.dart';
import 'package:to_do/application/home_bloc/home_state.dart';
import 'package:to_do/presentation/home_screen/widget/incomplited_task.dart';

class VerticalListViewBuilder extends StatelessWidget {
  const VerticalListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddItemBloc, AddItemState>(
      listener: (context, addItemState) {
        if (addItemState is DateChangedState) {
          context.read<HomeBloc>().add(LoadTasksForDateEvent(DateFormat.yMMMMEEEEd().format(addItemState.selectedDate)));
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          if (homeState is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (homeState is TaskEmpty) {
            return Center(child: Lottie.asset('assets/images/no data found.json'));
          } else if (homeState is TaskLoaded) {
            
            return InComplitedTask(tasks: homeState.tasks);
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }

}
