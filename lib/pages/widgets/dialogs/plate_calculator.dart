import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/bar_selector.dart';
import 'package:gym_tracker_ui/pages/widgets/plates_selector.dart';
import 'package:gym_tracker_ui/pages/widgets/weight_visualizer.dart';

class PlateCalculator extends StatefulWidget {
  const PlateCalculator({super.key});

  @override
  State<PlateCalculator> createState() => _PlateCalculatorState();
}

class _PlateCalculatorState extends State<PlateCalculator> {
  double _totalWeight = 0;
  int _totalPlates = 0;
  Map<Plate, int> _selectedPlates = {};

  ///
  /// Funciones para widgets.
  ///

  void _addPlateHandler(Plate selectedPlate) {
    if (_totalPlates >= 7) {
      setState(() {
        _totalPlates += 1;
      });
      return;
    }

    setState(() {
      _totalPlates += 1;
      _totalWeight += selectedPlate.weightInLbs;
      _selectedPlates = _simplifyPlates(_totalWeight);
    });
  }

  void _resetCalculator() {
    setState(() {
      _selectedPlates = {};
      _totalWeight = 0;
      _totalPlates = 0;
    });
  }

  ///
  /// Simplificar la lista de pesos.
  /// Esto se puede poner en un data source para realizar el precalculo.
  ///

  Plate _getPlateFromWeight(int weight) {
    double mappedWeight = weight / 10;
    switch (mappedWeight) {
      case 45:
        return Plate45();
      case 35:
        return Plate35();
      case 25:
        return Plate25();
      case 10:
        return Plate10();
      case 5:
        return Plate5();
      case 2.5:
        return Plate2Dot5();
    }

    throw Exception("No such plate.");
  }

  Map<Plate, int> _simplifyPlates(double targetWeight) {
    ///
    /// Obtener lista de los pesos.
    ///

    final weights = [];
    for (final plate in plates) {
      weights.add((plate.weightInLbs * 10).toInt());
    }

    int mappedTargetWeight = targetWeight.toInt() * 10;
    final usedPlates = List.generate(mappedTargetWeight + 1, (_) => -1);

    final dp = List.generate(mappedTargetWeight + 1, (_) => mappedTargetWeight + 1);
    dp[0] = 0;

    for (int i = 0; i < mappedTargetWeight + 1; i++) {
      for (int weight in weights) {
        if (weight <= i && 1 + dp[i - weight] < dp[i]) {
          dp[i] = min(dp[i], 1 + dp[i - weight]);
          usedPlates[i] = weight;
        }
      }
    }

    if (dp[mappedTargetWeight] > mappedTargetWeight) {
      return {};
    }

    Map<Plate, int> solution = {};
    int curentWeight = mappedTargetWeight;
    while (curentWeight > 0) {
      int lastPlate = usedPlates[curentWeight];
      final plateType = _getPlateFromWeight(lastPlate);
      solution[plateType] =
          solution.containsKey(plateType) ? solution[plateType]! + 1 : 1;
      curentWeight -= lastPlate;
    }

    return solution;
  }

  @override
  Widget build(BuildContext context) {
    bool isWeightNotAllowed = _totalPlates > 7;
    bool barIsEmpty = _totalPlates == 0;

    final titleText = barIsEmpty
        ? const Text(
            "Add a plate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        : isWeightNotAllowed
            ? Text(
                "Weight not allowed.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.error,
                ),
              )
            : RichText(
                text: TextSpan(
                  text: "Total Weight: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: "${_totalWeight.toStringAsFixed(2)} units.",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
              );

    return AlertDialog(
      title: const Text(
        "Plate Calculator",
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              const SizedBox(height: 8),
              titleText,
              WeightVisualizer(
                selectedPlates: _selectedPlates,
                selectedBarWeight: 7.5,
              ),
              const SizedBox(height: 8),
              PlatesSelector(onAddPlate: _addPlateHandler),
              const Divider(),
              const BarSelector(),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _resetCalculator,
          child: const Text("Reset"),
        ),
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
