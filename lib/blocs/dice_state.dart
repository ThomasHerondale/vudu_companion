part of 'dice_bloc.dart';

abstract class DiceState extends Equatable {
  const DiceState();
}

abstract class DiceRolled extends DiceState {
  final List<DiceFace> faces;
  final List<bool> lockFlags;
  final List<bool> saleFlags;

  const DiceRolled(this.faces, this.lockFlags, this.saleFlags);

  @override
  List<Object> get props => [faces, lockFlags, saleFlags];
}

class DiceInvalidRolled extends DiceRolled {

  const DiceInvalidRolled() : super(
      const [DiceFace.invalid, DiceFace.invalid, DiceFace.invalid,
        DiceFace.invalid, DiceFace.invalid],
      const [false, false, false, false, false],
      const [false, false, false, false, false]
  );

}

class DiceValidRolled extends DiceRolled {
  final bool reRollable;

  DiceValidRolled(super.faces, super.lockFlags, super.saleFlags) :
  reRollable = isReRollable(lockFlags, saleFlags);

  DiceValidRolled copyWith({
    List<DiceFace>? faces,
    List<bool>? lockFlags,
    List<bool>? saleFlags
  }) {
    return DiceValidRolled(
      faces ?? super.faces,
      lockFlags ?? super.lockFlags,
      saleFlags ?? super.saleFlags
    );
  }
}

class DiceRolling extends DiceState {
  @override
  List<Object?> get props => [];
}
