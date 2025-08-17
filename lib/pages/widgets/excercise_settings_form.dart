import 'package:flutter/material.dart';
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
      required IntensityIndicators intensityIndicator,
      required Units unit,
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

  /// Indicador de intensidad seleccionado.
  ///
  IntensityIndicators _selectedIntensityIndicator = IntensityIndicators.none;

  /// Unidad de medida seleccionada.
  ///
  Units _selectedUnit = Units.kgs;

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

  void _changeIntensityIndicatorHandler(
      IntensityIndicators? selectedIndicator) {
    setState(() {
      _selectedIntensityIndicator =
          selectedIndicator ?? IntensityIndicators.none;
    });
  }

  void _changeUnitHandler(Units? selectedUnit) {
    setState(() {
      _selectedUnit = selectedUnit ?? Units.units;
    });
  }

  void _onSaveExcerciseSettings() {
    widget.onSaveExcerciseSettings(
      description: _excerciseDescriptionController.text,
      name: _excerciseNameController.text,
      intensityIndicator: _selectedIntensityIndicator,
      minNumberOfReps: _selectedRepRangeStart,
      maxNumberOfReps: _selectedRepRangeEnd,
      unit: _selectedUnit,
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
    return Column(
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
        const SizedBox(height: 12),
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
        UnitSelector(
          selectedUnit: _selectedUnit,
          onChangeSelectedUnit: _changeUnitHandler,
        ),
        const SizedBox(height: 12),
        IntensityIndicatorSelector(
          selectedIntensityIndicator: _selectedIntensityIndicator,
          onChangeSelectedIntensityIndicator: _changeIntensityIndicatorHandler,
        ),
        const SizedBox(height: 12),
        Card(
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
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: _onSaveExcerciseSettings,
          icon: const Icon(Icons.save),
          label: const Text("Save"),
        ),
      ],
    );
  }
}
