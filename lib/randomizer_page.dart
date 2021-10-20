import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class RandomizerPage extends ConsumerWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  final randomGenerator = Random();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final randomizer = watch(randomizerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          randomizer.generatedNumber?.toString() ?? 'Generate a number',
          style: const TextStyle(
            fontSize: 42,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read(randomizerProvider.notifier).generateRandomNumber();
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
