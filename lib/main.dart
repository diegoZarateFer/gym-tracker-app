import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/screens/register_workout.dart';

final ThemeData mainAppTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFBB86FC),
    primaryContainer: Color(0xFF3700B3),
    secondary: Color(0xFF03DAC6),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    error: Color(0xFFCF6679),
    onPrimary: Color(0xFF000000),
    onSecondary: Color(0xFF000000),
    onBackground: Color(0XFFFFFFFF),
    onSurface: Color(0XFFFFFFFF),
    onError: Color(0xFF000000),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F1F1F),
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFBB86FC),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF03DAC6),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: const Color(0xFFBB86FC),
    inactiveTrackColor: Colors.grey[700],
    thumbColor: const Color(0xFFBB86FC),
    overlayColor: const Color(0x332B86FC),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardColor: const Color(0xFF1E1E1E),
  dividerColor: Colors.grey[700],
  splashColor: const Color(0x33BB86FC),
  highlightColor: const Color(0x22BB86FC),
  textTheme: TextTheme(
    headline6:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(color: Colors.grey[300]),
    bodyText2: TextStyle(color: Colors.grey[400]),
    button: const TextStyle(color: Colors.black),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainAppTheme,
      home: const RegisterWorkout(),
    );
  }
}
