
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../dice.dart';

part 'dice_event.dart';
part 'dice_state.dart';

class DiceBloc extends Bloc<DiceEvent, DiceState> {

  DiceBloc() : super(const DiceInvalidRolled()) {
    on<RollDice>((event, emit) {
      var state = this.state;
      if (state is DiceInvalidRolled) {
        List<DiceFace> newFaces = List.from(state.faces);
        for (var i = 0; i < 5; i++) {
          if (!state.lockFlags[i]) {
            newFaces[i] = rollDice();
          }
        }
        emit(DiceValidRolled(newFaces, state.lockFlags, state.saleFlags));
      } else if (state is DiceValidRolled) {
        // Se rimane almeno un dado da lanciare
        if (state.reRollable) {
          List<DiceFace> newFaces = List.from(state.faces);
          List<bool> newSaleFlags = List.from(state.saleFlags);
          var idx = getDiceToSell(state.lockFlags, newSaleFlags);
          newSaleFlags[idx] = true;
          for (var i = 0; i < 5; i++) {
            if (!state.lockFlags[i] && !newSaleFlags[i]) {
              newFaces[i] = rollDice();
            }
          }
          emit(DiceValidRolled(newFaces, state.lockFlags, newSaleFlags));
        }
      }
    });
    on<LockDice>((event, emit) {
      var state = this.state;
      if (state is DiceValidRolled) {
        List<bool> newLockFlags = List.from(state.lockFlags);
        if(!state.saleFlags[event.index]) {
          newLockFlags[event.index] = !newLockFlags[event.index];
        }
        emit(state.copyWith(lockFlags: newLockFlags));
      }
    });
    on<ResetDice>((event, emit) {
      emit(const DiceInvalidRolled());
    });
  }
}

int? _findSalableDiceIdx(List<bool> lockFlags, List<bool> saleFlags) {
  int? idx;
  int rollableCount = -1;
  for (var i = 0; i < 5; i++) {
    if (!lockFlags[i] && !saleFlags[i]) {
      idx = i;
      rollableCount++;
    }
  }
  return rollableCount == 0 ? null : idx;
}

bool isReRollable(List<bool> lockFlags, List<bool> saleFlags) {
  return _findSalableDiceIdx(lockFlags, saleFlags) != null;
}

int getDiceToSell(List<bool> lockFlags, List<bool> saleFlags) {
  var idx = _findSalableDiceIdx(lockFlags, saleFlags);
  assert (idx != null);
  return idx ?? 0;
}
