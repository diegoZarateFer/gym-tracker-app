import 'package:flutter/material.dart';

enum IntensityIndicators { none, rir, rpe }

class IntensityIndicatorSelector extends StatelessWidget {
  const IntensityIndicatorSelector({
    super.key,
    required this.selectedIntensityIndicator,
    required this.onChangeSelectedIntensityIndicator,
  });

  final IntensityIndicators selectedIntensityIndicator;
  final void Function(IntensityIndicators? selectedIndicator)
      onChangeSelectedIntensityIndicator;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            const Text(
              "Intensity Indicator:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            RadioListTile<IntensityIndicators>(
              value: IntensityIndicators.rir,
              groupValue: selectedIntensityIndicator,
              subtitle: const Text(
                "Measures how hard an excercise feels.",
              ),
              title: const Text(
                "RIR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: onChangeSelectedIntensityIndicator,
              activeColor: const Color(0xFF8E6CEF),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(),
            RadioListTile<IntensityIndicators>(
              value: IntensityIndicators.rpe,
              groupValue: selectedIntensityIndicator,
              subtitle: const Text(
                "Is the number of reps before failure.",
              ),
              title: const Text(
                "RPE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: onChangeSelectedIntensityIndicator,
              activeColor: const Color(0xFF8E6CEF),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(),
            RadioListTile<IntensityIndicators>(
              value: IntensityIndicators.none,
              groupValue: selectedIntensityIndicator,
              title: const Text(
                "None",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: onChangeSelectedIntensityIndicator,
              activeColor: const Color(0xFF8E6CEF),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ],
        ),
      ),
    );
  }
}
