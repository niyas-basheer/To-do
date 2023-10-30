import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/profile/profle.dart';
import 'package:to_do_app/taskmanager/addtask.dart';
import 'package:to_do_app/calander.dart/celender.dart';
import 'package:to_do_app/widgets/graph_widget.dart';
import 'package:to_do_app/home/home.dart';



      class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          
          selectedFontSize: 11,
          unselectedFontSize: 0,
          selectedItemColor: secondaryColor,
          unselectedItemColor: notselectedcolr ,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
             if (index == 0) {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const  HomePage(),
            ),
          );
        } else if (index == 1) {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                    const GraphScreen(),  
            ),
          );
        } else if (index == 3) {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                    const Calendar(), 
            ),
          );
        } else if (index == 4) {
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const profileScreen(),
            ),
          );
        } else {
          
          onTap(index);
        }
          },
          items: const [
               BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.chartColumn),
          label: 'Graph',
        ),
        BottomNavigationBarItem(
          icon: SizedBox.shrink(), 
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Calender',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
          ],
        ),
        Positioned(
          bottom: 0, 
          left: MediaQuery.of(context).size.width / 2 - 28, 
          child: FloatingActionButton(
            backgroundColor: secondaryColor,
            child: const Icon(Icons.add, ), 
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                    const AddTaskPage(),
            ),
          );
            },
          ),
        ),
      ],
    );
  }
}
 

        
         
       