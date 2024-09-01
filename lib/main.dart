import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/application/adding_details_bloc/adding_details_bloc.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_bloc.dart';
import 'package:to_do/application/dashboard_bloc/dashboard_bloc.dart';
import 'package:to_do/application/home_bloc/home_bloc.dart';
import 'package:to_do/application/splash_bloc/splash_bloc.dart';
import 'package:to_do/application/theme_bloc/theme_bloc.dart';
import 'package:to_do/application/theme_bloc/theme_state.dart';
import 'package:to_do/domain/model/task_model/task_model.dart';
import 'package:to_do/domain/repositary/notification_function.dart';
import 'package:to_do/presentation/home_screen/widget/horizontal_builder.dart';
import 'package:to_do/presentation/splash_screen/splash_screen.dart';
import 'package:to_do/utils/theme/theme.dart';


 final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await NotificationFunction.init();
  Hive.registerAdapter(TaskAdapter());
  await Hive.initFlutter();
    final Box<Task> taskBox= await Hive.openBox<Task>('tasks');
  runApp( MainApp(taskBox: taskBox,));
}

class MainApp extends StatelessWidget {
   final Box<Task> taskBox;
  const MainApp({super.key, required this.taskBox});

  @override
  Widget build(BuildContext context) {
  return  MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => ThemeBloc()),
        BlocProvider(create: (context)=>SplashBloc()),
        BlocProvider(create: (context)=>HomeBloc(),child: const HorizontalBuilder()),
        BlocProvider(create: (context)=> NavigationBloc()),
        BlocProvider(create: (context)=> AddDetailBloc()),
        BlocProvider(create: (context) => DashboardBloc(taskBox)),
        ],
    child:  BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
          home: const SplashScreen(),
        );
      },
    ), 
    );
  }
}
 