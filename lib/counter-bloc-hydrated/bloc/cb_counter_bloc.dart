// ignore_for_file: depend_on_referenced_packages, unnecessary_import

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cb_counter_event.dart';
part 'cb_counter_state.dart';

class CbCounterBloc extends Bloc<CbCounterEvent, CbCounterState>
    with HydratedMixin {
  CbCounterBloc() : super(CbCounterState.initial()) {
    on<IncrementCbCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
  }

  @override
  CbCounterState? fromJson(Map<String, dynamic> json) {
    return CbCounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CbCounterState state) {
    return state.toMap();
  }
}
