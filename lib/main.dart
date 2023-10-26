import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/calander.dart/celender.dart';
import 'package:to_do_app/database/signin.dart';
import 'package:to_do_app/widgets/graphwidget.dart';
import 'package:to_do_app/home/home.dart';
import 'package:to_do_app/profile/profle.dart';
import 'package:to_do_app/splash/secondspalsh.dart';
import 'package:to_do_app/sign/signin.dart';
import 'package:to_do_app/sign/signup.dart';
import 'package:to_do_app/database/taskclass.dart';
import 'splash/spalshscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(SubtaskAdapter());
  await Hive.initFlutter();
   await Hive.openBox<Task>('tasks');
    await Hive.openBox<UserModel>('users'); 

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
        '/screenOne': (context) => const SignIn(),
        '/screenThree': (context) => const SignUp(),
        '/screenfour': (context) => const SplashScreen(),
        '/screenfive': (context) => const SecondScreen(),
        '/screensix': (context) => const Calendar(),
        '/screenEight': (context) => const profileScreen(),
        '/screenNine': (context) => const GraphScreen(),
      },
    );
  }
}
