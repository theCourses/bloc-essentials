// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'increment_counter_bloc.dart';

class IncrementCounterState extends Equatable {
  final int incrementCounter;

  const IncrementCounterState({required this.incrementCounter});

  factory IncrementCounterState.initial() {
    return const IncrementCounterState(incrementCounter: 0);
  }

  @override
  List<Object> get props => [incrementCounter];

  IncrementCounterState copyWith({
    int? incrementCounter,
  }) {
    print("incrementcounter: " + incrementCounter.toString());
    return IncrementCounterState(
      incrementCounter: incrementCounter ?? this.incrementCounter,
    );
  }

  @override
  bool get stringify => true;
}
