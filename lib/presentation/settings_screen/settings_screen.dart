import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/application/theme_bloc/theme_bloc.dart';
import 'package:to_do/application/theme_bloc/theme_event.dart';
import 'package:to_do/application/theme_bloc/theme_state.dart';
import 'package:to_do/presentation/settings_screen/widget/about.dart';
import 'package:to_do/presentation/settings_screen/widget/privecy_policy.dart';
import 'package:to_do/presentation/settings_screen/widget/terms_condition.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Terms and Conditions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditionsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'About',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text('Theme Mode', style: Theme.of(context).textTheme.labelSmall),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: state.isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleThemeEvent());
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
