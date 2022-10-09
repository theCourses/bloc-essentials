import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc-listener/bloc/increment_counter_bloc.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc/blocs/color/color_bloc.dart';

class BlocToBlocListenerApp extends StatelessWidget {
  const BlocToBlocListenerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<IncrementCounterBloc>(
          create: (context) => IncrementCounterBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Bloc to bloc listener',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const BlocToBlocListenerScreen()),
    );
  }
}

class BlocToBlocListenerScreen extends StatefulWidget {
  const BlocToBlocListenerScreen({super.key});

  @override
  State<BlocToBlocListenerScreen> createState() =>
      _BlocToBlocListenerScreenState();
}

class _BlocToBlocListenerScreenState extends State<BlocToBlocListenerScreen> {
  int increment = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          increment = 1;
        } else if (state.color == Colors.green) {
          increment = 10;
        } else if (state.color == Colors.blue) {
          increment = 100;
        } else if (state.color == Colors.black) {
          context
              .read<IncrementCounterBloc>()
              .add(const ChangeIncrementCounterEvent(incrementSize: -100));
          increment = -100;
        }
      },
      child: Scaffold(
          backgroundColor: context.watch<ColorBloc>().state.color,
          appBar: AppBar(
            title: const Text('Cubit to cubit'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<ColorBloc>().add(ChangeColorEvent());
                    },
                    child: const Text('Change color')),
                Text(
                  '${context.watch<IncrementCounterBloc>().state.incrementCounter}',
                  style: const TextStyle(
                      fontSize: 52.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<IncrementCounterBloc>().add(
                          ChangeIncrementCounterEvent(
                              incrementSize: increment));
                    },
                    child: const Text('Increment number'))
              ],
            ),
          )),
    );
  }
}
