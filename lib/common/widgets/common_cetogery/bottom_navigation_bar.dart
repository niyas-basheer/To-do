import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_bloc.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_event.dart';
import 'package:to_do/application/bottem_nav_bar_bloc/bottem_nav_bar_state.dart';
import 'package:to_do/presentation/add_item_screen/add_item_screen.dart';
import 'package:to_do/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:to_do/presentation/home_screen/home_screen.dart';
import 'package:to_do/presentation/settings_screen/settings_screen.dart';
import 'package:to_do/utils/constants/colors.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  final List<Widget> _pages = const [
    HomeScreen(),
    DashboardScreen(),
    AddItemScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                return _pages[state.currentIndex];
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  return CrystalNavigationBar(
                    currentIndex: state.currentIndex,
                    selectedItemColor: Tcolors.primary,
                    unselectedItemColor: const Color.fromARGB(255, 233, 233, 51),
                    backgroundColor: Colors.white.withOpacity(0.6),
                    onTap: (index) {
                      context
                          .read<NavigationBloc>()
                          .add(NavigateToPage(index));
                    },
                    items:  [
                      CrystalNavigationBarItem(
                          icon: EneftyIcons.home_bold,
                          unselectedIcon: EneftyIcons.home_outline),
                      CrystalNavigationBarItem(
                          icon: EneftyIcons.graph_outline,
                          unselectedIcon: EneftyIcons.graph_outline),
                      CrystalNavigationBarItem(
                          icon: EneftyIcons.add_circle_bold,
                          unselectedIcon: EneftyIcons.add_circle_bold),
                      CrystalNavigationBarItem(
                        icon: EneftyIcons.profile_bold,
                        unselectedIcon: EneftyIcons.profile_outline,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
