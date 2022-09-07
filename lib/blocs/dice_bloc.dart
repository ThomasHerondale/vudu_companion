
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../dice.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {
  DiceBloc() : super(const DiceRolled()) {
    on<RollDice>((event, emit) {
      var state = this.state;
      if (state is DiceRolled) {
        List<DiceFace> newFaces = List.from(state.faces);
        for (var i = 0; i < 5; i++) {
          if (!state.lockFlags[i]) {
            newFaces[i] = rollDice();
          }
        }
        emit(state.copyWith(faces: newFaces));
      }
    });
    on<LockDice>((event, emit) {
      var state = this.state;
      if (state is DiceRolled) {
        List<bool> newLockFlags = List.from(state.lockFlags);
        newLockFlags[event.index] = !newLockFlags[event.index];
        emit(state.copyWith(lockFlags: newLockFlags));
      }
    });
    on<ResetDice>((event, emit) {
      emit(const DiceRolled());
    });
  }
}
