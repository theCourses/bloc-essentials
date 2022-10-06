import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payload/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: const MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
