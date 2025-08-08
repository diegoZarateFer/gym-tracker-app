import 'package:flutter/material.dart';
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
              child: TableCalendar(
                firstDay: DateTime.now().add(const Duration(days: -365)),
                focusedDay: DateTime.now(),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                calendarFormat: _calendarFormat,
                availableCalendarFormats: const {CalendarFormat.week: 'week'},
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                ),
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