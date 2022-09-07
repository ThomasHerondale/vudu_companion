import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vudu_companion/blocs/dice_bloc.dart';

import 'screens/dice_screen.dart';

void main() => runApp(const VuduApp());

class VuduApp extends StatelessWidget {
  const VuduApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DiceBloc(),
        child: const DiceScreen(),

      ),
    );
  }
}
