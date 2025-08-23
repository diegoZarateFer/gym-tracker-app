import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/pages/widgets/regular_history_excercise_log.dart';
import 'package:gym_tracker_ui/pages/widgets/rir_history_excercise_log.dart';
import 'package:gym_tracker_ui/pages/widgets/rpe_history_excercise_log.dart';

class ExcerciseHistoryPage extends StatefulWidget {
  static const String route = "/excercise-history";

  const ExcerciseHistoryPage({
    super.key,
  });

  @override
  State<ExcerciseHistoryPage> createState() => _ExcerciseHistoryPageState();
}

class _ExcerciseHistoryPageState extends State<ExcerciseHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Excercise Name"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            RIRHistoryExcerciseLog(),
            RPEHistoryExcerciseLog(),
            RegularHistoryExcerciseLog(),
          ],
        ),
      ),
    );
  }
}
