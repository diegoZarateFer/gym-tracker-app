import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/plates_selector.dart';

class PlateCalculator extends StatelessWidget {
  const PlateCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return AlertDialog(
      title: const Text(
        "Plate Calculator",
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(2, 2, 2, keyboardSpace + 16),
            child: const Column(
              children: [
                PlatesSelector(),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Done"),
        ),
      ],
    );
  }
}
