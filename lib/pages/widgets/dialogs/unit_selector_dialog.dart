import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/modal_bottom_handle.dart';

enum Units { units, kgs, lbs }

class UnitSelectorDialog extends StatefulWidget {
  const UnitSelectorDialog({
    super.key,
  });

  @override
  State<UnitSelectorDialog> createState() => _UnitSelectorDialogState();
}

class _UnitSelectorDialogState extends State<UnitSelectorDialog> {
  /// Unidad de medida seleccionada.
  ///
  Units __selectedUnit = Units.kgs;

  /// Handler para cambiar unidades.
  ///
  void _changeUnitHandler(Units? newSelectedUnit) {
    setState(() {
      __selectedUnit = newSelectedUnit ?? Units.units;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(2, 2, 2, keyboardSpace + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalBottomHandle(),
            const Text(
              "Unit For The Excercise",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<Units>(
                      value: Units.kgs,
                      groupValue: __selectedUnit,
                      title: const Text(
                        "Kilograms (kgs)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: _changeUnitHandler,
                      activeColor: Theme.of(context).colorScheme.primary,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    const Divider(),
                    RadioListTile<Units>(
                      value: Units.lbs,
                      groupValue: __selectedUnit,
                      title: const Text(
                        "Pounds (lbs)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: _changeUnitHandler,
                      activeColor: Theme.of(context).colorScheme.primary,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    const Divider(),
                    RadioListTile<Units>(
                      value: Units.units,
                      groupValue: __selectedUnit,
                      title: const Text(
                        "Units",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onChanged: _changeUnitHandler,
                      activeColor: Theme.of(context).colorScheme.primary,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
