import 'package:flutter/material.dart';

enum Units { units, kgs, lbs }

class UnitSelectorPage extends StatefulWidget {
  const UnitSelectorPage({
    super.key,
  });

  @override
  State<UnitSelectorPage> createState() => _UnitSelectorPageState();
}

class _UnitSelectorPageState extends State<UnitSelectorPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Unit"),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
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
                activeColor: const Color(0xFF8E6CEF),
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
                activeColor: const Color(0xFF8E6CEF),
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
                activeColor: const Color(0xFF8E6CEF),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
