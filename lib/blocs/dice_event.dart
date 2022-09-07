part of 'dice_bloc.dart';

abstract class DiceEvent extends Equatable {
  const DiceEvent();
}

class ResetDice extends DiceEvent {
  @override
  List<Object?> get props => [];

}

class RollDice extends DiceEvent {
  @override
  List<Object?> get props => [];
}

class LockDice extends DiceEvent {
  final int index;

  const LockDice(this.index);

  @override
  List<Object?> get props => [index];
}



