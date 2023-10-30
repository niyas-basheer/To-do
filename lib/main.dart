import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/calander.dart/celender.dart';
import 'package:to_do_app/widgets/graph_widget.dart';
import 'package:to_do_app/home/home.dart';
import 'package:to_do_app/profile/profle.dart';
import 'package:to_do_app/splash/secondspalsh.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'splash/spalshscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TaskAdapter());

  Hive.registerAdapter(SubtaskAdapter());
  await Hive.initFlutter();
   await Hive.openBox<Task>('tasks');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            
      ),
      initialRoute: '/screenfour',
      routes: {
        '/': (context) => const HomePage(),
        '/screenfour': (context) => const SplashScreen(),
        '/screenfive': (context) => const SecondScreen(),
        '/screensix': (context) => const Calendar(),
        '/screenEight': (context) => const profileScreen(),
        '/screenNine': (context) => const GraphScreen(),
      },
    );
  }
}
