import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc/blocs/color/color_bloc.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc/blocs/normalIncrementCounter/normal_increment_counter_bloc.dart';

class BlocToBlocApp extends StatelessWidget {
  const BlocToBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
        BlocProvider<NormalIncrementCounterBloc>(
            create: (context) => NormalIncrementCounterBloc(
                colorBloc: context.read<ColorBloc>())),
      ],
      child: MaterialApp(
          title: 'Bloc to bloc listener',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const BlocToBlocScreen()),
    );
  }
}

class BlocToBlocScreen extends StatelessWidget {
  const BlocToBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                '${context.watch<NormalIncrementCounterBloc>().state.counter}',
                style: const TextStyle(
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<NormalIncrementCounterBloc>()
                        .add(ChangeCounterEvent());
                  },
                  child: const Text('Increment number'))
            ],
          ),
        ));
  }
}
