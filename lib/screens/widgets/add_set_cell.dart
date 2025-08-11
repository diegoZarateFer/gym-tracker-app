import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/screens/extensions/context_ext.dart';
import 'package:gym_tracker_ui/screens/widgets/register_regular_set_dialog.dart';

class AddSetCell extends StatelessWidget {
  const AddSetCell({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 2,
        ),
        child: GestureDetector(
          onTap: () {
            context.showBottomDialog(const RegisterRegularSet());
          },
          child: GestureDetector(
            child: const Icon(
              Icons.add_circle_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
