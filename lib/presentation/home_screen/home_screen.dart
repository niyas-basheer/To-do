import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/home_bloc/home_bloc.dart';
import 'package:to_do/application/home_bloc/home_event.dart';
import 'package:to_do/domain/repositary/notification_function.dart';
import 'package:to_do/presentation/home_screen/widget/vertical_builder.dart';
import 'package:to_do/presentation/task_detail_screen/task_detail_screen.dart';
import 'widget/custem_search_delegate.dart';
import 'widget/task_heading.dart';
import 'widget/horizontal_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
void initState() {
  super.initState();
  BlocProvider.of<HomeBloc>(context).add(FetchTasks());
   listenToNotifications();
}

 listenToNotifications() {
    NotificationFunction.onClickNotification.stream.listen((event) {
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetailScreen(labal:event,),
                  ),
                );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Welcom Home',style:Theme.of(context).textTheme.headlineLarge,),
        actions: [
          IconButton(
            onPressed: (){
          showSearch(context: context,delegate: CustemSearchDelegate());
          },
           icon: const Icon(Icons.search))
        ],
      ),
      body:   const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              TaskHeading(title: 'Complited Task',),
             HorizontalBuilder(),
              TaskHeading(title: 'Incomplite Task' ),
               VerticalBuilder(),
            ],
          ),
        ),
      ),
       
    );
  }
}
