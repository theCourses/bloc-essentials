// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';

class ColorBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('ColorBlocObserver(event): ${bloc.runtimeType}, $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('ColorBlocObserver(eroor): ${bloc.runtimeType}, $error, $stackTrace');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('ColorBlocObserver(change): ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('ColorBlocObserver(transition): ${bloc.runtimeType}, $transition');
  }
}
