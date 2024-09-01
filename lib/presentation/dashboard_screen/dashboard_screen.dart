import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/dashboard_bloc/dashboard_bloc.dart';
import 'package:to_do/application/dashboard_bloc/dashboard_state.dart';
import 'package:to_do/presentation/dashboard_screen/widget/graph.dart';
import 'package:to_do/presentation/home_screen/widget/incomplited_task.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown for selecting the date range
                    DropdownButton<String>(
                      value: state.selectedDateRange,
                      onChanged: (value) {
                        if (value != null) {
                          context.read<DashboardBloc>().add(ChangeDateRangeEvent(value));
                        }
                      },
                      items: ['Week', 'Month', 'Year'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    
                    // Graph widget with state tasks
                    SizedBox(
                      height: 200,
                      child: TaskCompletionGraph(tasks: state.tasks),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Incomplete tasks widget with state tasks
                    InComplitedTask(tasks: state.tasks),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
