import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/core/theme/app_theme.dart';
import 'package:gym_tracker_ui/pages/excercise_settings_page.dart';
import 'package:gym_tracker_ui/pages/register_workout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const RegisterWorkoutPage(),
      routes: {
        RegisterWorkoutPage.route: (context) => const RegisterWorkoutPage(),
        ExcerciseSettingsPage.route: (context) => const ExcerciseSettingsPage(),
      },
    );
  }
}
