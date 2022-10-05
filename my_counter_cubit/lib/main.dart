import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCounter Cubit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text(
            '0',
            style: TextStyle(fontSize: 52.0),
          ),
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () {},
              heroTag: 'increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {},
              heroTag: 'increment',
              child: const Icon(Icons.deck),
            ),
          ],
        ),
      ),
    );
  }
}
