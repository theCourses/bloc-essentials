part of 'theme_bloc.dart';

enum Apptheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final Apptheme apptheme;

  ThemeState({
    this.apptheme = Apptheme.light,
  });

  factory ThemeState.initial() {
    return ThemeState();
  }

  @override
  List<Object> get props => [apptheme];

  @override
  bool get stringify => true;

  ThemeState copyWith({
    Apptheme? apptheme,
  }) {
    return ThemeState(
      apptheme: apptheme ?? this.apptheme,
    );
  }
}
