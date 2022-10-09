import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_cubit/cubit/counter_cubit.dart';

class AnounymousRouteAccessApp extends StatelessWidget {
  const AnounymousRouteAccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anounymous route access',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const AnounymousRouteAccessScreen(),
      ),
    );
  }
}

class AnounymousRouteAccessScreen extends StatelessWidget {
  const AnounymousRouteAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anounymous route access')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BlocProvider.value(
                    value: context.read<CounterCubit>(),
                    child: const AnounymousRouteAccessOtherScreen(),
                  );
                }));
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
  }
}

class AnounymousRouteAccessOtherScreen extends StatelessWidget {
  const AnounymousRouteAccessOtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('other screen')),
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
