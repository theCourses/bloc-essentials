import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/my_counter_cubit/cubit/counter_cubit.dart';

class GeneratedRouteAccessApp extends StatelessWidget {
  const GeneratedRouteAccessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anounymous route access',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: (RouteSettings setttings) {
        switch (setttings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                    value: CounterCubit(),
                    child: const GeneratedRouteAccessScreen()));
          case '/other':
            return MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                      value: CounterCubit(),
                      child: const GeneratedRouteAccessOtherScreen(),
                    ));
          default:
            return null;
        }
      },
    );
  }
}

class GeneratedRouteAccessScreen extends StatelessWidget {
  const GeneratedRouteAccessScreen({super.key});

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
                      child: const GeneratedRouteAccessOtherScreen());
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

class GeneratedRouteAccessOtherScreen extends StatelessWidget {
  const GeneratedRouteAccessOtherScreen({super.key});

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
