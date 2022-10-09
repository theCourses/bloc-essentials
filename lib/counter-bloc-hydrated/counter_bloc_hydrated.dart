import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/my-counter-bloc/bloc/counter_bloc.dart';

class CounterBlocHydratedApp extends StatelessWidget {
  const CounterBlocHydratedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'MyCounter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CounterBlocHydratedScreen(),
      ),
    );
  }
}

class CounterBlocHydratedScreen extends StatelessWidget {
  const CounterBlocHydratedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyCounterBloc'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '${context.watch<CounterBloc>().state.counter}',
            style: const TextStyle(fontSize: 52.0),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
        ]),
      ),
    );
  }
}
