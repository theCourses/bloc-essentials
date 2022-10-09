import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increment_counter_event.dart';
part 'increment_counter_state.dart';

class IncrementCounterBloc
    extends Bloc<IncrementCounterEvent, IncrementCounterState> {
  IncrementCounterBloc() : super(IncrementCounterState.initial()) {
    on<ChangeIncrementCounterEvent>((event, emit) {
      emit(state.copyWith(
          incrementCounter: state.incrementCounter + event.incrementSize));
    });
  }
}
