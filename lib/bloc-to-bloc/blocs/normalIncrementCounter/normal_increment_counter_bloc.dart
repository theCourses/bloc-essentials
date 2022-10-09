// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_essentials/bloc-to-bloc/blocs/color/color_bloc.dart';

part 'normal_increment_counter_event.dart';
part 'normal_increment_counter_state.dart';

class NormalIncrementCounterBloc
    extends Bloc<NormalIncrementCounterEvent, NormalIncrementCounterState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription colorSubscription;
  NormalIncrementCounterBloc({required this.colorBloc})
      : super(NormalIncrementCounterState.initial()) {
    colorSubscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        add(ChangeCounterEvent());
      }
    });
    on<ChangeCounterEvent>((event, emit) {
      print(state.counter);
      state.copyWith(counter: state.counter + incrementSize);
      emit(state.copyWith(counter: state.counter + incrementSize));
      print(state.counter);
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
