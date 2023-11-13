import 'package:to_do_app/home/home.dart';
import 'package:to_do_app/widgets/color.dart';


import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, Key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Stack(
          children: [
          
            Positioned(
              top: 22,
              left: 25,
              child: Image.asset(
                "assets/images/urgent-bro-TEZ.png",
                width: 100, 
                height: 100,
              ),
            ),

         
            Positioned(
              top: 140,
              child: Image.asset(
                "assets/images/WhatsApp Image 2023-09-27 at 09.28.49.jpg",
                width: 400, 
                height: 330, 
              ),
            ),

            
            const Positioned(
              bottom: 180, 
              left: 20, 
              child: Text(
                '''Manage 
Your 
Task with''',
                style: TextStyle(
                  color: blackcolor, 
                  fontSize: 40,
                  fontFamily: 'DelaGothicOne', 
                ),
              ),
            ),

           
            const Positioned(
              bottom: 130, 
              left: 20, 
              child: Text(
                "DayTask",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 50, 
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DelaGothicOne',
                ),
              ),
            ),
            Positioned(
              bottom:
                  20, 
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 0.9 * MediaQuery.of(context).size.width, 
                  height: 60, 
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const HomePage(), 
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(0)), 
                      ),
                      backgroundColor: secondaryColor,
                      alignment: Alignment.center, 
                    ),
                    child: const Text(
                      "Let's Start",
                      style: TextStyle(
                        fontSize: 16, 
                        color: blackcolor,
                        fontFamily: 'DelaGothicOne',
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
