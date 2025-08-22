import 'package:flutter/material.dart';

enum IntensityIndicators { none, rir, rpe }

class IntensityIndicatorSelector extends StatefulWidget {
  const IntensityIndicatorSelector({
    super.key,
  });

  @override
  State<IntensityIndicatorSelector> createState() =>
      _IntensityIndicatorSelectorState();
}

class _IntensityIndicatorSelectorState
    extends State<IntensityIndicatorSelector> {
  /// Indicador de intensidad seleccionado.
  ///
  IntensityIndicators _selectedIntensityIndicator = IntensityIndicators.none;

  void _changeIntensityIndicatorHandler(
      IntensityIndicators? selectedIndicator) {
    setState(() {
      _selectedIntensityIndicator =
          selectedIndicator ?? IntensityIndicators.none;
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
        title: const Text("Intensity Indicator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<IntensityIndicators>(
                  value: IntensityIndicators.rir,
                  groupValue: _selectedIntensityIndicator,
                  subtitle: const Text(
                    "How many reps you could still do before failure.",
                  ),
                  title: const Text(
                    "RIR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: _changeIntensityIndicatorHandler,
                  activeColor: Theme.of(context).colorScheme.primary,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                const Divider(),
                RadioListTile<IntensityIndicators>(
                  value: IntensityIndicators.rpe,
                  groupValue: _selectedIntensityIndicator,
                  subtitle: const Text(
                    "A 1–10 scale rating how hard you feel you’re working during exercise.",
                  ),
                  title: const Text(
                    "RPE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: _changeIntensityIndicatorHandler,
                  activeColor: Theme.of(context).colorScheme.primary,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                const Divider(),
                RadioListTile<IntensityIndicators>(
                  value: IntensityIndicators.none,
                  groupValue: _selectedIntensityIndicator,
                  title: const Text(
                    "None",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text(
                    "Only register weight and repetitions.",
                  ),
                  onChanged: _changeIntensityIndicatorHandler,
                  activeColor: Theme.of(context).colorScheme.primary,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
