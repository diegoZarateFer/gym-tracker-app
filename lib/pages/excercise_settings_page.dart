import 'package:flutter/material.dart';

enum IntensityIndicators { none, rir, rpe }

class ExcerciseSettingsPage extends StatefulWidget {
  static const String route = "excercise-settings";

  const ExcerciseSettingsPage({super.key});

  @override
  State<ExcerciseSettingsPage> createState() => _ExcerciseSettingsPageState();
}

class _ExcerciseSettingsPageState extends State<ExcerciseSettingsPage> {
  /// Valores del rango de repeticiones.
  ///
  int _selectedRepRangeStart = 5;
  int _selectedRepRangeEnd = 10;

  /// Indicador de intensidad seleccionado.
  ///
  IntensityIndicators _selectedIntensityIndicator = IntensityIndicators.none;

  /// Funciones para los widgets.
  ///
  void _changeRepsRangeHandler(RangeValues newValues) {
    setState(() {
      _selectedRepRangeStart = newValues.start.toInt();
      _selectedRepRangeEnd = newValues.end.toInt();
    });
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
          child: Column(
            children: [
              const TextField(
                textAlignVertical: TextAlignVertical.center,
                maxLines: 1,
                maxLength: 30,
                decoration: InputDecoration(
                  counterText: "",
                  label: Text("Excercise Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              const TextField(
                textAlignVertical: TextAlignVertical.center,
                maxLines: 2,
                decoration: InputDecoration(
                  counterText: "",
                  label: Text("Description"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Card(
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
                        groupValue: _selectedIntensityIndicator,
                        subtitle: const Text(
                          "Measures how hard an excercise feels.",
                        ),
                        title: const Text(
                          "RIR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (IntensityIndicators? selectedIndicator) {
                          setState(() {
                            _selectedIntensityIndicator =
                                selectedIndicator ?? IntensityIndicators.none;
                          });
                        },
                        activeColor: const Color(0xFF8E6CEF),
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      const Divider(),
                      RadioListTile<IntensityIndicators>(
                        value: IntensityIndicators.rpe,
                        groupValue: _selectedIntensityIndicator,
                        subtitle: const Text(
                          "Is the number of reps before failure.",
                        ),
                        title: const Text(
                          "RPE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (IntensityIndicators? selectedIndicator) {
                          setState(() {
                            _selectedIntensityIndicator =
                                selectedIndicator ?? IntensityIndicators.none;
                          });
                        },
                        activeColor: const Color(0xFF8E6CEF),
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
                        onChanged: (IntensityIndicators? selectedIndicator) {
                          setState(() {
                            _selectedIntensityIndicator =
                                selectedIndicator ?? IntensityIndicators.none;
                          });
                        },
                        activeColor: const Color(0xFF8E6CEF),
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ],
                  ),
                ),
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
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
