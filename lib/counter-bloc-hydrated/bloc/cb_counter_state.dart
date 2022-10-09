// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cb_counter_bloc.dart';

class CbCounterState extends Equatable {
  final int counter;

  const CbCounterState({required this.counter});

  factory CbCounterState.initial() {
    return const CbCounterState(counter: 0);
  }

  @override
  List<Object?> get props => [counter];

  CbCounterState copyWith({
    int? counter,
  }) {
    return CbCounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CbCounterState.fromMap(Map<String, dynamic> map) {
    return CbCounterState(
      counter: map['counter'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CbCounterState.fromJson(String source) =>
      CbCounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}
