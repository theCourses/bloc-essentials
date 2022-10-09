// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_essentials/cubit-to-cubit/cubit/colorCubit/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementSize = 1;

  // In order to read the color state value, CounterCubit needs an instance of ColorCubit
  final ColorCubit colorCubit;

  // Stream subscribtions would not dispose automatically so memory leakage may occur,
  // In that case you need a variable to unsubscribe the colorCubit stream.
  late final StreamSubscription colorSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    // To know ColorCubit state it has to listen to the ColorCubit stream
    // Stream subscribtions would not dispose automatically so memory leakage may occur,
    // In that case you need a variable to unsubscribe the colorCubit stream.
    // This listen() reads ColorStates whenever the ColorState changes. So the initial state won't be readed
    colorSubscription = colorCubit.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        emit(state.copyWith(counter: state.counter - 100));
        incrementSize = -100;
      }
    });
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }

  // Close fuction is called when the instance is no longer needed.
  // Once close() is called, the instance can no longer be used.
  // Here when close the ColorCubit stream;
  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
