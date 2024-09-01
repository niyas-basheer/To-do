import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/add_item_bloc/add_item_bloc.dart';
import 'package:to_do/application/add_item_bloc/add_item_event.dart';
import 'package:to_do/application/add_item_bloc/add_item_state.dart';
import 'package:to_do/presentation/add_item_screen/adding_taskdeails_screen.dart';
import 'package:to_do/utils/formatters/formatter.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TFormatter.formatDate(DateTime.now()),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey),
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          const Spacer(),
          BlocConsumer<AddItemBloc, AddItemState>(
            listener: (context, state) {
              if (state is TaskAddedState) {
                // Navigate to another page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddDetailScreen(), 
                  ),
                );
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<AddItemBloc>().add(TaskAddedEvent());
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(' + Add Task '),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

