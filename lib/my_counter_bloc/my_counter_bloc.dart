import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_bloc/other_page_bloc.dart';

class MyCounterBlocApp extends StatelessWidget {
  const MyCounterBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'MyCounter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyCounterBlocScreen(),
      ),
    );
  }
}

class MyCounterBlocScreen extends StatelessWidget {
  const MyCounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        if (state.counter == 3) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    content: Text('counter is ${state.counter}'));
              });
        } else if (state.counter == -1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const OtherPageBloc();
          }));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyCounterBloc'),
        ),
        body: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
              heroTag: 'decrement',
              child: const Icon(Icons.remove),
            ),
            Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: const TextStyle(fontSize: 52.0),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
              heroTag: 'increment',
              child: const Icon(Icons.add),
            ),
          ]),
        ),
      ),
    );
  }
}
