// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'increment_counter_cubit.dart';

class IncrementCounterState extends Equatable {
  final int counter;

  const IncrementCounterState({
    required this.counter,
  });

  factory IncrementCounterState.initial() {
    return const IncrementCounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  IncrementCounterState copyWith({
    int? counter,
  }) {
    return IncrementCounterState(
      counter: counter ?? this.counter,
    );
  }
}
