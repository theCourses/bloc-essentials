import 'package:flutter/material.dart';

class BlocToBlocListenerApp extends StatelessWidget {
  const BlocToBlocListenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bloc to bloc listener',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const BlocToBlocListenerScreen());
  }
}

class BlocToBlocListenerScreen extends StatelessWidget {
  const BlocToBlocListenerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
