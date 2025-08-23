import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/modal_bottom_handle.dart';

class RegisterRegularSet extends StatefulWidget {
  const RegisterRegularSet({super.key});

  @override
  State<RegisterRegularSet> createState() => _RegisterRegularSetState();
}

class _RegisterRegularSetState extends State<RegisterRegularSet> {
  /// Focus de la UI.
  ///
  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();

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
              const SizedBox(height: 16),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.videocam),
                    label: const Text("Record Set"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Done"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
