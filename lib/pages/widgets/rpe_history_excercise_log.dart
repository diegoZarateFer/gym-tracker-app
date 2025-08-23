import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/extensions/context_ext.dart';
import 'package:gym_tracker_ui/pages/widgets/excercise_history_log_header.dart';
import 'package:gym_tracker_ui/pages/widgets/field_cell.dart';
import 'package:gym_tracker_ui/pages/widgets/dialogs/register_rpe_set_dialog.dart';
import 'package:gym_tracker_ui/pages/widgets/title_cell.dart';

class RPEHistoryExcerciseLog extends StatelessWidget {
  const RPEHistoryExcerciseLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
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
            const ExcerciseHistoryLogHeader(title: "Jun 22, 2025"),
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
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(2),
              },
              children: <TableRow>[
                const TableRow(
                  children: [
                    TitleCell("Set"),
                    TitleCell("Weight"),
                    TitleCell("Reps"),
                    TitleCell("RPE"),
                  ],
                ),
                TableRow(
                  children: [
                    const TitleCell("1"),
                    FieldCell(
                      title: "120",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRPESet());
                      },
                    ),
                    FieldCell(
                      title: "12",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRPESet());
                      },
                    ),
                    FieldCell(
                      title: "2",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRPESet());
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TitleCell("2"),
                    FieldCell(
                      title: "120",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRPESet());
                      },
                    ),
                    FieldCell(
                      title: "12",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRPESet());
                      },
                    ),
                    FieldCell(
                      title: "2",
                      onRegisterSet: () {
                        context.showBottomDialog(const RegisterRPESet());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
