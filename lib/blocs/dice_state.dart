part of 'dice_bloc.dart';

abstract class DiceState extends Equatable {
  const DiceState();
}

class DiceRolled extends DiceState {
  final List<DiceFace> faces;
  final List<bool> lockFlags;


  const DiceRolled({
    this.faces = const [DiceFace.invalid, DiceFace.invalid, DiceFace.invalid,
        DiceFace.invalid, DiceFace.invalid],
    this.lockFlags = const [false, false, false, false, false]
      });

  @override
  List<Object?> get props => [faces, lockFlags];

  DiceRolled copyWith({
    List<DiceFace>? faces,
    List<bool>? lockFlags,
  }) {
    return DiceRolled(
      faces: faces ?? this.faces,
      lockFlags: lockFlags ?? this.lockFlags,
    );
  }
}

class DiceRolling extends DiceState {
  @override
  List<Object?> get props => [];
}
