import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/add_item_bloc/add_item_bloc.dart';
import 'package:to_do/presentation/add_item_screen/widget/veritical_listview.dart';
import 'widget/add_task.dart';
import 'widget/horizontal_calander.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddItemBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Item', style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              AddTask(),
              HorizontalCalander(),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: VerticalListViewBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
