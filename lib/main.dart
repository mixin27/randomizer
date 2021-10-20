import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'randomizer_state_notifier.dart';
import 'range_select_page.dart';

void main() {
  runApp(const RandomizerApp());
}

final randomizerProvider =
    StateNotifierProvider<RandomizerStateNotifier, RandomizerState>(
        (ref) => RandomizerStateNotifier());

class RandomizerApp extends StatelessWidget {
  const RandomizerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: RangeSelectPage(),
      ),
    );
  }
}
