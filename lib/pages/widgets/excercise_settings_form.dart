import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/extensions/context_ext.dart';
import 'package:gym_tracker_ui/pages/widgets/intensity_indicator_selector.dart';
import 'package:gym_tracker_ui/pages/widgets/unit_selector.dart';

class ExcerciseSettingsForm extends StatefulWidget {
  const ExcerciseSettingsForm({
    super.key,
    required this.onSaveExcerciseSettings,
  });

  final void Function(
      {required String name,
      required String description,
      required int minNumberOfReps,
      required int maxNumberOfReps}) onSaveExcerciseSettings;

  @override
  State<ExcerciseSettingsForm> createState() => _ExcerciseSettingsFormState();
}

class _ExcerciseSettingsFormState extends State<ExcerciseSettingsForm> {
  /// Controllers.
  ///
  final _excerciseNameController = TextEditingController();
  final _excerciseDescriptionController = TextEditingController();

  /// Valores del rango de repeticiones.
  ///
  int _selectedRepRangeStart = 5;
  int _selectedRepRangeEnd = 10;

  ///TODO: Agregar validaciones a los campos.
  ///

  /// Funciones para los widgets.
  ///
  void _changeRepsRangeHandler(RangeValues newValues) {
    setState(() {
      _selectedRepRangeStart = newValues.start.toInt();
      _selectedRepRangeEnd = newValues.end.toInt();
    });
  }

  void _onSaveExcerciseSettings() {
    widget.onSaveExcerciseSettings(
      description: _excerciseDescriptionController.text,
      name: _excerciseNameController.text,
      minNumberOfReps: _selectedRepRangeStart,
      maxNumberOfReps: _selectedRepRangeEnd,
    );
  }

  @override
  void dispose() {
    _excerciseNameController.dispose();
    _excerciseDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: _excerciseNameController,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 1,
            maxLength: 30,
            decoration: const InputDecoration(
              counterText: "",
              label: Text("Excercise Name"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _excerciseNameController,
            textAlignVertical: TextAlignVertical.center,
            maxLines: 2,
            decoration: const InputDecoration(
              counterText: "",
              label: Text("Description"),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Theme.of(context).colorScheme.surface,
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              title: const Text("Unit"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onPressed: () {
                  context.pushWithSlide(const UnitSelectorPage());
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
              title: const Text("Intensity Indicator"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                onPressed: () {
                  context.pushWithSlide(const IntensityIndicatorSelector());
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(children: [
                const Text(
                  "Rep range:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(text: "Between"),
                      TextSpan(
                          text:
                              " $_selectedRepRangeStart - $_selectedRepRangeEnd ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      const TextSpan(text: "reps."),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RangeSlider(
                  min: 1,
                  max: 25,
                  values: RangeValues(_selectedRepRangeStart.toDouble(),
                      _selectedRepRangeEnd.toDouble()),
                  onChanged: _changeRepsRangeHandler,
                ),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _onSaveExcerciseSettings,
              icon: const Icon(Icons.save),
              label: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
