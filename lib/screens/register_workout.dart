import 'package:flutter/material.dart';
import 'package:gym_tracker_ui/screens/widgets/regular_set_container.dart';
import 'package:gym_tracker_ui/screens/widgets/rir_set_container.dart';
import 'package:gym_tracker_ui/screens/widgets/rpe_set_container.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final formatter = DateFormat.yMd();

class RegisterWorkout extends StatelessWidget {
  const RegisterWorkout({super.key});

  final CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workout Name")),
      body: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.now().add(const Duration(days: -365)),
                    focusedDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    calendarFormat: _calendarFormat,
                    availableCalendarFormats: const {
                      CalendarFormat.week: 'week'
                    },
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "Add Excercise",
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RIRSetContainer(),
                  SizedBox(height: 16),
                  RegularSetContainer(),
                  SizedBox(height: 16),
                  RPESetContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


//  CalendarWeek(
//             backgroundColor: Colors.transparent,
//             height: 150,
//             showMonth: false,
//             minDate: DateTime.now().add(const Duration(days: -365)),
//             maxDate: DateTime.now().add(const Duration(days: 365)),
//             monthViewBuilder: (DateTime time) => Align(
//               alignment: FractionalOffset.center,
//               child: Container(
//                 margin: const EdgeInsets.symmetric(
//                   vertical: 2,
//                 ),
//                 child: Text(
//                   formatter.format(time),
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//             decorations: [
//               DecorationItem(
//                 decorationAlignment: FractionalOffset.bottomRight,
//                 date: DateTime.now(),
//                 decoration: const Icon(
//                   Icons.today,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),