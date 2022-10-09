part of 'normal_increment_counter_bloc.dart';

abstract class NormalIncrementCounterEvent extends Equatable {
  const NormalIncrementCounterEvent();

  @override
  List<Object> get props => [];
}

class ChangeCounterEvent extends NormalIncrementCounterEvent {}
