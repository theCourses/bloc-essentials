import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit-listener/cubit/cubit/increment_counter_cubit.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit/cubit/color/color_cubit.dart';

class CubitToCubitListenerApp extends StatelessWidget {
  const CubitToCubitListenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<IncrementCounterCubit>(
            create: (context) => IncrementCounterCubit())
      ],
      child: MaterialApp(
        title: 'Cubit to cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CubitToCubitListenerScreen(),
      ),
    );
  }
}

class CubitToCubitListenerScreen extends StatefulWidget {
  const CubitToCubitListenerScreen({super.key});

  @override
  State<CubitToCubitListenerScreen> createState() =>
      _CubitToCubitListenerScreenState();
}

class _CubitToCubitListenerScreenState
    extends State<CubitToCubitListenerScreen> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, colorState) {
        if (colorState.color == Colors.red) {
          incrementSize = 1;
        } else if (colorState.color == Colors.green) {
          incrementSize = 10;
        } else if (colorState.color == Colors.blue) {
          incrementSize = 100;
        } else if (colorState.color == Colors.black) {
          context.read<IncrementCounterCubit>().changeCounter(-100);
          incrementSize = -100;
        }
      },
      child: Scaffold(
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
                  '${context.watch<IncrementCounterCubit>().state.counter}',
                  style: const TextStyle(
                      fontSize: 52.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<IncrementCounterCubit>()
                          .changeCounter(incrementSize);
                    },
                    child: const Text('Increment number'))
              ],
            ),
          )),
    );
  }
}
