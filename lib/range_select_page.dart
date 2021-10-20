import 'package:flutter/material.dart';

import 'randomizer_page.dart';
import 'range_select_form.dart';

class RangeSelectPage extends StatelessWidget {
  RangeSelectPage({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Range'),
      ),
      body: RangeSelectForm(
        formKey: formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
