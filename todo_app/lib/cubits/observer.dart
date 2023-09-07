import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) => debugPrint("onChange $bloc");

  @override
  void onClose(BlocBase bloc) => debugPrint("onChange $bloc");

  @override
  void onCreate(BlocBase bloc) => debugPrint("onChange $bloc");

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) =>
      debugPrint("onChange $bloc");

  @override
  void onEvent(Bloc bloc, Object? event) => debugPrint("onChange $bloc");

  @override
  void onTransition(Bloc bloc, Transition transition) =>
      debugPrint("onChange $bloc");
}
