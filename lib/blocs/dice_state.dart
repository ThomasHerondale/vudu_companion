part of 'dice_bloc.dart';

abstract class DiceState extends Equatable {
  const DiceState();
}

abstract class DiceRolled extends DiceState {
  final List<DiceFace> faces;
  final List<bool> lockFlags;

  const DiceRolled(this.faces, this.lockFlags);

  @override
  List<Object> get props => [faces, lockFlags];
}

class DiceInvalidRolled extends DiceRolled {

  const DiceInvalidRolled() : super(
      const [DiceFace.invalid, DiceFace.invalid, DiceFace.invalid,
        DiceFace.invalid, DiceFace.invalid],
      const [false, false, false, false, false]
  );

}

class DiceValidRolled extends DiceRolled {

  const DiceValidRolled(super.faces, super.lockFlags);

  DiceValidRolled copyWith({
    List<DiceFace>? faces,
    List<bool>? lockFlags,
  }) {
    return DiceValidRolled(
      faces ?? super.faces,
      lockFlags ?? super.lockFlags,
    );
  }
}

class DiceRolling extends DiceState {
  @override
  List<Object?> get props => [];
}
