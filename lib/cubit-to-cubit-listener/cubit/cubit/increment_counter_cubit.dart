// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increment_counter_state.dart';

class IncrementCounterCubit extends Cubit<IncrementCounterState> {
  int incrementSize = 1;
  IncrementCounterCubit() : super(IncrementCounterState.initial());

  void changeCounter(int incrementSize) {
    emit(state.copyWith(counter: state.counter + incrementSize));
  }
}
