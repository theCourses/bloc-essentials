// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'normal_increment_counter_bloc.dart';

class NormalIncrementCounterState extends Equatable {
  final int counter;

  const NormalIncrementCounterState({required this.counter});

  factory NormalIncrementCounterState.initial() {
    return const NormalIncrementCounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  NormalIncrementCounterState copyWith({
    int? counter,
  }) {
    return NormalIncrementCounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  bool get stringify => true;
}
