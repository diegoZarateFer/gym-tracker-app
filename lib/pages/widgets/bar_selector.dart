import 'package:flutter/material.dart';

class BarSelector extends StatelessWidget {
  const BarSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var weight in [
            "EZ Bar (7.5kg)",
            "Standard Bar (20kg)",
            "Light Bar (15kg)"
          ])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(weight),
              ),
            ),
        ],
      ),
    );
  }
}
