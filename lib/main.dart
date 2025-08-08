import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/screens/register_workout.dart';

final ThemeData greenBlackTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0A0A0A), // Negro más profundo
  primaryColor: const Color(0xFF00FF88), // Verde neón
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF00FF88),
    secondary: Color(0xFF00C853),
    background: Color(0xFF0A0A0A),
    surface: Color(0xFF1A1A1A), // Un poco más claro que el fondo
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onBackground: Colors.white70,
    onSurface: Colors.white70,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0F0F0F),
    foregroundColor: Color(0xFF00FF88), // Verde neón para títulos
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF00FF88),
    ),
    iconTheme: IconThemeData(color: Color(0xFF00FF88)),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge:
        TextStyle(color: Color(0xFF00FF88), fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF00FF88),
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shadowColor: const Color(0xFF00FF88),
      elevation: 6,
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF1A1A1A),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    elevation: 4,
    margin: const EdgeInsets.all(8),
    shadowColor: const Color(0xFF00FF88).withOpacity(0.5),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1A1A1A),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF00FF88), width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white24),
      borderRadius: BorderRadius.circular(12),
    ),
    hintStyle: const TextStyle(color: Colors.white54),
    labelStyle: const TextStyle(color: Color(0xFF00FF88)),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF00FF88)),
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
      theme: greenBlackTheme,
      home: const RegisterWorkout(),
    );
  }
}
