import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/dice_bloc.dart';

class Dice extends StatelessWidget {
  final int index;

  const Dice(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceBloc, DiceState>(
      builder: (context, state) {
        if (state is DiceRolled) {
          return InkWell(
            onTap: () => context.read<DiceBloc>().add(LockDice(index)),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: state.faces[index].faceColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: state.lockFlags[index] ? 3 : 0,
                  color: state.lockFlags[index] ?
                  Colors.grey.shade600
                  :
                  Colors.transparent,
                )
              ),
              ),
          );
        } else {
          return const CircularProgressIndicator();
        }
        },
    );
  }
}


enum DiceFace {
  blue(Colors.blue),
  red(Colors.red),
  green(Colors.green),
  pink(Colors.pinkAccent),
  purple(Colors.deepPurpleAccent),
  yellow(Colors.yellow),
  invalid(Colors.grey);

  final Color faceColor;

  const DiceFace(this.faceColor);
}

DiceFace rollDice() {
  return DiceFace.values[Random().nextInt(6)];
}
