import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vudu_companion/dice.dart';

class DiceView extends StatelessWidget {
  const DiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row of three
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Dice(0),
            Dice(1),
            Dice(2)
          ],
        ),
        const Gap(20),
        // Row of two
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Dice(3),
            Dice(4)
          ],
        )
      ],
    );
  }
}
