import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/modal_bottom_handle.dart';

enum IntensityIndicators { none, rir, rpe, subjective }

class IntensityIndicatorSelectorDialog extends StatefulWidget {
  const IntensityIndicatorSelectorDialog({
    super.key,
  });

  @override
  State<IntensityIndicatorSelectorDialog> createState() =>
      _IntensityIndicatorSelectorDialogState();
}

class _IntensityIndicatorSelectorDialogState
    extends State<IntensityIndicatorSelectorDialog> {
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
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalBottomHandle(),
          const Text(
            "Intensity Indicator",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
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
                      value: IntensityIndicators.subjective,
                      groupValue: _selectedIntensityIndicator,
                      subtitle: const Text(
                        "Recommended for beginners. It allows to choose how hard a set was for you.",
                      ),
                      title: const Text(
                        "Subjective",
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
        ],
      ),
    );
  }
}
