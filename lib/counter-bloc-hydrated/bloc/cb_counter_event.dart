part of 'cb_counter_bloc.dart';

abstract class CbCounterEvent extends Equatable {
  const CbCounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCbCounterEvent extends CbCounterEvent {}
