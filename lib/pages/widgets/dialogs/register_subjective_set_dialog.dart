import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/modal_bottom_handle.dart';

enum SubjectiveScale { easy, medium, hard }

class RegisterSubjectiveSet extends StatefulWidget {
  const RegisterSubjectiveSet({super.key});

  @override
  State<RegisterSubjectiveSet> createState() => _RegisterSubjectiveSetState();
}

class _RegisterSubjectiveSetState extends State<RegisterSubjectiveSet> {
  /// Focus de la UI.
  ///
  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();

  /// Variable de dificultad subjetiva.
  ///
  SubjectiveScale _selectedDifficulty = SubjectiveScale.medium;

  /// Funciones para los widgets.
  ///
  void _changeDifficulty(SubjectiveScale? selectedValue) {
    setState(() {
      _selectedDifficulty = selectedValue ?? SubjectiveScale.easy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 2, 2, keyboardSpace + 16),
          child: Column(
            children: [
              const ModalBottomHandle(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.check,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Register Your Set",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: TextField(
                      focusNode: _firstFocus,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_secondFocus);
                      },
                      textAlign: TextAlign.center,
                      maxLength: 4,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "units",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "x",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      focusNode: _secondFocus,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.center,
                      onSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                      },
                      maxLength: 5,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 32),
              const Text("How hard was the set?"),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<SubjectiveScale>(
                    value: SubjectiveScale.easy,
                    groupValue: _selectedDifficulty,
                    onChanged: _changeDifficulty,
                  ),
                  const Text("Easy"),
                  const SizedBox(width: 8),
                  Radio<SubjectiveScale>(
                    value: SubjectiveScale.medium,
                    groupValue: _selectedDifficulty,
                    onChanged: _changeDifficulty,
                  ),
                  const Text("Medium"),
                  const SizedBox(width: 8),
                  Radio<SubjectiveScale>(
                    value: SubjectiveScale.hard,
                    groupValue: _selectedDifficulty,
                    onChanged: _changeDifficulty,
                  ),
                  const Text("Hard"),
                ],
              ),
              
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.videocam),
                  ),
                  const SizedBox(width: 2),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calculate),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Done"),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
