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
      backgroundColor: const Color(0x00170E04),
      body: Column(
        children: [
          const Gap(100),
          const DiceView(),
          const Gap(20),
          // Buttons...
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF413557),
                  ),
                  onPressed:
                      () => Future.delayed(
                          const Duration(seconds: 1),
                              () => context.read<DiceBloc>().add(RollDice())
                      ),
                  child: const Text(
                    'Lancia i dadi',
                    style: TextStyle(
                        color: Color(0xFF5EE43A),
                        fontFamily: 'Combo',
                        fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF413557),
                ),
                onPressed: () => context.read<DiceBloc>().add(ResetDice()),
                child: const Text(
                  'Nuovo turno',
                  style: TextStyle(
                      color: Color(0xFF5EE43A),
                      fontFamily: 'Combo',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      );
  }
}
