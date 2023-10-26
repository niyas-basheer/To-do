import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/widgets/calanderwidget.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'package:to_do_app/widgets/bottamnavbar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<Task> tasks = [];
  DateTime selectedDate = DateTime.now();
   late String selectedMonth;

 

  List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December",
  ];

  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTasks();
     selectedDate = DateTime.now(); // Initialize selectedDate with the present date.
    selectedMonth = DateFormat('MMMM').format(selectedDate);
  }

  int currentIndex = 3;

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> loadTasks() async {
    final taskBox = await Hive.openBox<Task>('tasks');
    setState(() {
      tasks = taskBox.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Schedule",
            style: TextStyle(
              fontSize: 15,
              color: blackcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: _buildCalendarList(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }

  Widget _buildCalendarList() {
    return Container(
      color: white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
         
          GestureDetector(
            onTap: () {
              _showMonthPicker(context);
            },
            child: Text(
              selectedMonth,
              style: const TextStyle(
                fontSize: 20,
                color: blackcolor,
              ),
            ),
          ),
          if (tasks.isNotEmpty) const SizedBox(height: 10),
          CalendarPageWidgets.buildHorizontalListView(
            selectedDate,
            onDaySelected,
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tasks",
              style: TextStyle(
                fontSize: 20,
                color: blackcolor,
              ),
            ),
          ),
          if (tasks.isNotEmpty) const SizedBox(height: 10),
          if (tasks.isNotEmpty)
            CalendarPageWidgets.buildVerticalListView(tasks,selectedDate,context),
        ],
      ),
    );
  }

 void _showMonthPicker(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: months.map((month) {
        return PopupMenuItem<String>(
          value: month,
          child: Text(month),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedMonth = value;

          // Calculate the corresponding month in the selected year.
          final selectedMonthIndex = months.indexOf(selectedMonth) + 1;
          selectedDate = DateTime(DateTime.now().year, selectedMonthIndex);
        });
      }
    });
  }
  void onDaySelected(DateTime day) {
    setState(() {
      selectedDate = day;
    });
  }
}
