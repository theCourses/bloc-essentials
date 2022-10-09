// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/payload/bloc/theme_bloc.dart';

class PayloadApp extends StatelessWidget {
  const PayloadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(builder: (context) {
        return MaterialApp(
            title: 'Payload',
            debugShowCheckedModeBanner: false,
            theme: context.watch<ThemeBloc>().state.apptheme == Apptheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const PayloadScreen());
      }),
    );
  }
}

class PayloadScreen extends StatelessWidget {
  const PayloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          final int randInt = Random().nextInt(10);
          print(randInt);
          context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
        },
        child: const Text('Change Theme'),
      )),
    );
  }
}
