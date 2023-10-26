// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:to_do_app/database/taskclass.dart';
// import 'package:to_do_app/widgets/color.dart';

// class TaskDisplay extends StatelessWidget {
//   final Task? task;
//   final List<bool> completedSubtasks;
//   final Function(int) toggleSubtaskCompletion;
//   final Function() editTask;
//   final Function() deleteTask;

//   TaskDisplay({
//     required this.task,
//     required this.completedSubtasks,
//     required this.toggleSubtaskCompletion,
//     required this.editTask,
//     required this.deleteTask,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Task Details',
//           style: TextStyle(
//             fontSize: 15,
//             color: blackcolor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: BackButton(
//           color: blackcolor,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: editTask,
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: deleteTask,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             Container(
//               width: 400,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 185, 188, 199),
//               ),
//               child: Text(
//                 task?.heading ?? 'No task found',
//                 style: const TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.w900,
//                   color: blackcolor,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 30),
//             if (task != null)
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Starting Date: ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: blackcolor,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.calendar_today, color: blackcolor),
//                         onPressed: () {},
//                       ),
//                       const Spacer(
//                         flex: 1,
//                       ),
//                       const Text(
//                         'Ending Date: ',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: blackcolor,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.calendar_today, color: blackcolor),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5.0),
//                   Row(
//                     children: [
//                       Text(
//                         task!.startDate != null
//                             ? DateFormat('yyyy-MM-dd').format(DateTime.parse(task!.startDate!))
//                             : 'Not selected',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: blackcolor,
//                         ),
//                       ),
//                       const Spacer(
//                         flex: 1,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 60),
//                         child: Text(
//                           task!.endDate != null
//                               ? DateFormat('yyyy-MM-dd').format(DateTime.parse(task!.endDate!))
//                               : 'Not selected',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             color: blackcolor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             const SizedBox(height: 50.0),
//             const Text(
//               'Task Details:',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: blackcolor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               task?.details ?? 'No task found',
//               style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 120),
//             const Text(
//               'Subtasks:',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: blackcolor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             if (task != null && task!.subtasks.isNotEmpty)
//               Column(
//                 children: List.generate(task!.subtasks.length, (index) {
//                   final subtask = task!.subtasks[index].description;
//                   final isCompleted = completedSubtasks[index];

//                   return ListTile(
//                     title: Text(
//                       subtask,
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: blackcolor,
//                         decoration: isCompleted ? TextDecoration.lineThrough : null,
//                       ),
//                     ),
//                     onTap: () {
//                       toggleSubtaskCompletion(index);
//                     },
//                   );
//                 }),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
