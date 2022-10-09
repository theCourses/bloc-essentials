// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'increment_counter_bloc.dart';

abstract class IncrementCounterEvent extends Equatable {
  const IncrementCounterEvent();

  @override
  List<Object> get props => [];
}

class ChangeIncrementCounterEvent extends IncrementCounterEvent {
  final int incrementSize;

  const ChangeIncrementCounterEvent({
    required this.incrementSize,
  });

  @override
  List<Object> get props => [incrementSize];
}
