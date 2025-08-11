import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/screens/extensions/context_ext.dart';
import 'package:gym_tracker_ui/screens/widgets/register_rir_set_dialog.dart';

class FieldCell extends StatelessWidget {
  const FieldCell(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: GestureDetector(
        onTap: () {
          context.showBottomDialog(const RegisterRIRSet());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.background,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
