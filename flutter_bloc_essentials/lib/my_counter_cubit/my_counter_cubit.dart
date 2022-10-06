import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_bloc/other_page_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_cubit/cubit/counter_cubit.dart';

class MyCounterCubitApp extends StatelessWidget {
  const MyCounterCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          title: 'MyCounter Cubit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const MyCounterCubitScreen()),
    );
  }
}

class MyCounterCubitScreen extends StatelessWidget {
  const MyCounterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MyCounterCubit'),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
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
          builder: (context, state) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    heroTag: 'decrement',
                    child: const Icon(Icons.remove),
                  ),
                  Text(
                    '${state.counter}',
                    style: const TextStyle(fontSize: 52.0),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    heroTag: 'increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
