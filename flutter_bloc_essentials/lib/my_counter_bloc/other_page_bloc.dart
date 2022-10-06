import 'package:flutter/material.dart';

class OtherPageBloc extends StatelessWidget {
  const OtherPageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Other'),
        ),
        body: const Center(
          child: Text(
            'Other',
            style: TextStyle(fontSize: 52.0),
          ),
        ));
  }
}
