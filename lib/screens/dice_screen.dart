import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vudu_companion/dice_view.dart';

import '../blocs/dice_bloc.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(100),
          const DiceView(),
          const Gap(20),
          // Buttons...
          ElevatedButton(
              onPressed:
                  () => Future.delayed(
                      const Duration(seconds: 1),
                          () => context.read<DiceBloc>().add(RollDice())
                  ),
              child: const Text('Roll')
          )
        ],
      ),
      );
  }
}
