import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/common/widgets/container/tasktile.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';

class CustemSearchDelegate extends SearchDelegate {
  final tasks = Hive.box<Task>('tasks').values.toList();
@override
List<Widget> buildActions (BuildContext context) {

  return [
    IconButton(
      onPressed: (){
        query ='';
      },
     icon: const Icon(Icons.clear))
  ];

}

@override
Widget buildLeading (BuildContext context) {
    return 
    IconButton(
      onPressed: () {
        close(context, null);
      },
     icon: const Icon(Icons.arrow_back))
  ;

}

@override
Widget buildResults (BuildContext context) {
  List <Task> machQuery = [];
  for (var element in tasks ) {
    if (element.heading.toLowerCase().contains(query.toLowerCase())) {
      machQuery.add(element);
    }
  }
  return  ListView.builder(itemBuilder: (context,index){
    var result = machQuery[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TaskTile(result),
    );
  },itemCount: machQuery.length,);
}

@override
Widget buildSuggestions (BuildContext context) {
   List <Task> machQuery = [];
  for (var element in tasks ) {
    if (element.heading.toLowerCase().contains(query.toLowerCase())) {
      machQuery.add(element);
    }
  }
  return  ListView.builder(itemBuilder: (context,index){
    var result = machQuery[index];
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TaskTile(result),
    );
  },itemCount: machQuery.length,);
}

}
  
