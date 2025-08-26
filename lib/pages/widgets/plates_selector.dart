import 'package:flutter/material.dart';

class PlatesSelector extends StatelessWidget {
  const PlatesSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 4,
      runSpacing: 4,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("45"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("25"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("10"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("5"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("2.5"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(2),
          ),
        ),
      ],
    );
  }
}
