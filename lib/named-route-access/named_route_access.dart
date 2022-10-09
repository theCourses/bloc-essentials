import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_cubit/cubit/counter_cubit.dart';

class NamedRouteAccessApp extends StatefulWidget {
  NamedRouteAccessApp({super.key});

  @override
  State<NamedRouteAccessApp> createState() => _NamedRouteAccessAppState();
}

class _NamedRouteAccessAppState extends State<NamedRouteAccessApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named route access',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const NamedRouteAccessScreen(),
            ),
        '/other': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const NamedRouteAccessOtherScreen(),
            )
      },
    );
  }
}

class NamedRouteAccessScreen extends StatelessWidget {
  const NamedRouteAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Named route access')),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/other');
                },
                child: const Text('Show me counter')),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                child: const Text('Increment counter'))
          ],
        )),
      );
    });
  }
}

class NamedRouteAccessOtherScreen extends StatelessWidget {
  const NamedRouteAccessOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Other screen')),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.counter}',
                style: const TextStyle(
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              );
            },
          ),
        ));
  }
}
