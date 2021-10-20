import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectForm extends StatelessWidget {
  const RangeSelectForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectTextFormField(
              labelText: 'Minimun',
              intValueSetter: (value) =>
                  context.read(randomizerProvider.notifier).setMin(value),
            ),
            const SizedBox(height: 12),
            RangeSelectTextFormField(
              labelText: 'Maximun',
              intValueSetter: (value) =>
                  context.read(randomizerProvider.notifier).setMax(value),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectTextFormField extends StatelessWidget {
  const RangeSelectTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null) {
          return 'Must be an integer';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
