import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit/cubit/colorCubit/color_cubit.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit/cubit/counterCubit/counter_cubit.dart';

class CubitToCubitApp extends StatelessWidget {
  const CubitToCubitApp({super.key});

  // Here it is a simple way to use 2 cubits in one widgets tree :P
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider<ColorCubit>(
  //     create: (context) => ColorCubit(),
  //     child: BlocProvider<CounterCubit>(
  //       create: (context) => CounterCubit(colorCubit: ColorCubit()),
  //       child: MaterialApp(
  //         title: 'Cubit to cubit',
  //         debugShowCheckedModeBanner: false,
  //         theme: ThemeData(primarySwatch: Colors.blue),
  //         home: const CubitToCubitScreen(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(
            create: (context) =>
                CounterCubit(colorCubit: context.read<ColorCubit>()))
      ],
      child: MaterialApp(
        title: 'Cubit to cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CubitToCubitScreen(),
      ),
    );
  }
}

class CubitToCubitScreen extends StatelessWidget {
  const CubitToCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
          title: const Text('Cubit to cubit'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                  },
                  child: const Text('Change color')),
              Text(
                '${context.watch<CounterCubit>().state.counter}',
                style: const TextStyle(
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().changeCounter();
                  },
                  child: const Text('Increment number'))
            ],
          ),
        ));
  }
}
