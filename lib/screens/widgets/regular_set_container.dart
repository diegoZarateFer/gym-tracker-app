import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/screens/extensions/context_ext.dart';
import 'package:gym_tracker_ui/screens/widgets/add_set_cell.dart';
import 'package:gym_tracker_ui/screens/widgets/empty_cell.dart';
import 'package:gym_tracker_ui/screens/widgets/field_cell.dart';
import 'package:gym_tracker_ui/screens/widgets/notes_dialog.dart';
import 'package:gym_tracker_ui/screens/widgets/register_regular_set_dialog.dart';
import 'package:gym_tracker_ui/screens/widgets/text_dell.dart';
import 'package:gym_tracker_ui/screens/widgets/title_cell.dart';

class RegularSetContainer extends StatelessWidget {
  const RegularSetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  const Text(
                    'Regular Log Excersice',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.history),
                  ),
                  IconButton(
                    onPressed: () {
                      context.showBottomDialog(const ExerciseNotes());
                    },
                    icon: const Icon(Icons.edit_note_sharp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Table(
              border: const TableBorder(
                horizontalInside: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(2),
              },
              children: <TableRow>[
                const TableRow(
                  children: [
                    TitleCell("Set"),
                    TitleCell("Weight"),
                    TitleCell("Reps"),
                    TitleCell("Previous"),
                  ],
                ),
                TableRow(
                  children: [
                    const TitleCell("1"),
                    FieldCell(
                      title: "120",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRegularSet());
                      },
                    ),
                    FieldCell(
                      title: "12",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRegularSet());
                      },
                    ),
                    const TextCell("120kg"),
                  ],
                ),
                TableRow(
                  children: [
                    const TitleCell("2"),
                    const EmptyCell(),
                    AddSetCell(
                      onAddSet: () {
                        context.showBottomDialog(const RegisterRegularSet());
                      },
                    ),
                    const TextCell("120kg"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(
                "New Set",
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
