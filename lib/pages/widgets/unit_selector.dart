import 'package:flutter/material.dart';

enum Units { units, kgs, lbs }

class UnitSelector extends StatelessWidget {
  const UnitSelector({
    super.key,
    required this.selectedUnit,
    required this.onChangeSelectedUnit,
  });

  final Units selectedUnit;
  final void Function(Units? selectedUnit) onChangeSelectedUnit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            const Text(
              "Units:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            RadioListTile<Units>(
              value: Units.kgs,
              groupValue: selectedUnit,
              title: const Text(
                "KGS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: onChangeSelectedUnit,
              activeColor: const Color(0xFF8E6CEF),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(),
            RadioListTile<Units>(
              value: Units.lbs,
              groupValue: selectedUnit,
              title: const Text(
                "LBS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: onChangeSelectedUnit,
              activeColor: const Color(0xFF8E6CEF),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Divider(),
            RadioListTile<Units>(
              value: Units.units,
              groupValue: selectedUnit,
              title: const Text(
                "Units",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onChanged: onChangeSelectedUnit,
              activeColor: const Color(0xFF8E6CEF),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ],
        ),
      ),
    );
  }
}
