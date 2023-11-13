import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';
import '../widgets/bottamnavbar.dart';
import 'package:to_do_app/widgets/widgetshome.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Welcome Back'
           ,style:  TextStyle(
                fontSize: 20,
                color: blackcolor,
                fontWeight: FontWeight.bold
              ),
        ),
      ),
      body: SafeArea(child: _buildTaskList(context)),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }



  Widget _buildTaskList(BuildContext context) {
    return const HomePageContent(); 
  }
}
