import 'package:bmi_calculator/models/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemaCubit extends Cubit<ThemeData> {
  static final _temaClaro = ImcTheme.lightTheme;
  static final _temaEscuro = ImcTheme.darkTheme;

  TemaCubit() : super(_temaEscuro);

  void alteraTema() => state.brightness == Brightness.light
      ? emit(_temaEscuro)
      : emit(_temaClaro);
}
