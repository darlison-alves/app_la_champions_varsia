import 'package:flutter/material.dart';

class MatchPlayerInfo extends StatelessWidget {
  final String name;
  final int goals;

  final Function onPressedAdd;
  final Function onPressedRemove;

  MatchPlayerInfo(
      {super.key,
      required this.name,
      required this.goals,
      required this.onPressedAdd,
      required this.onPressedRemove});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          goals.toString(),
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {
                onPressedAdd();
              },
              label: const Icon(Icons.add),
            ),
            TextButton.icon(
              onPressed: () {
                onPressedRemove();
              },
              label: const Icon(Icons.remove),
            ),
          ],
        )
      ],
    );
  }
}
