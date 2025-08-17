import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/excercise_settings_form.dart';
import 'package:gym_tracker_ui/pages/widgets/intensity_indicator_selector.dart';
import 'package:gym_tracker_ui/pages/widgets/unit_selector.dart';

class ExcerciseSettingsPage extends StatefulWidget {
  static const String route = "excercise-settings";

  const ExcerciseSettingsPage({super.key});

  @override
  State<ExcerciseSettingsPage> createState() => _ExcerciseSettingsPageState();
}

class _ExcerciseSettingsPageState extends State<ExcerciseSettingsPage> {
  void _saveExcerciseSettingsHandler(
      {required String name,
      required String description,
      required IntensityIndicators intensityIndicator,
      required Units unit,
      required int minNumberOfReps,
      required int maxNumberOfReps}) {
    print(name);
    print(description);
    print(intensityIndicator);
    print(unit);
    print(minNumberOfReps);
    print(maxNumberOfReps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        title: const Text("Excercise Name"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ExcerciseSettingsForm(
            onSaveExcerciseSettings: _saveExcerciseSettingsHandler,
          ),
        ),
      ),
    );
  }
}
