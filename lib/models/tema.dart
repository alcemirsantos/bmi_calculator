import 'package:flutter/material.dart';

class ImcTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _darkFocusColor = _darkFillColor.withOpacity(.12);
  static final Color _lightFocusColor = _lightFillColor.withOpacity(.12);

  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFF8D8E98),
    primaryVariant: Color(0xFFbdbec9),
    secondary: Color(0xFFEB1555),
    secondaryVariant: Color(0xFFff5d81),
    surface: Color(0xFFbcbcbc),
    background: Color(0xFFeeeeee),
    error: Colors.red,
    onPrimary: Color(0xFF0A0E21),
    onSecondary: _lightFillColor,
    onSurface: _lightFillColor,
    onBackground: _lightFillColor,
    onError: _lightFillColor,
    brightness: Brightness.light,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Color(0xFF0A0E21),
    primaryVariant: Color(0xFF313548),
    secondary: Color(0xFFEB1555),
    secondaryVariant: Color(0xFFff5d81),
    surface: Color(0xFF1D1E30),
    background: Color(0xFF0A0E21),
    error: Colors.red,
    onPrimary: Color(0xFF8D8E98),
    onSecondary: _darkFillColor,
    onSurface: Color(0xFF8D8E98),
    onBackground: _darkFillColor,
    onError: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900),
    headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    button: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(fontSize: 16),
    // bodyText1: TextStyle(),
    // bodyText2: TextStyle(),
  );

  static ThemeData lightTheme =
      themeData(_lightColorScheme, _textTheme, _lightFocusColor);
  static ThemeData darkTheme =
      themeData(_darkColorScheme, _textTheme, _darkFocusColor);

  static themeData(
          ColorScheme colorScheme, TextTheme textTheme, Color focusColor) =>
      ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: const Color(0xFF0A0E21),
        colorScheme: colorScheme,
        focusColor: focusColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: colorScheme.background,
          iconTheme: IconThemeData(color: colorScheme.primary),
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: colorScheme.secondary,
            onSurface: colorScheme.primary,
            backgroundColor: colorScheme.surface,
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: colorScheme.onSecondary,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.alphaBlend(
            _lightFillColor.withOpacity(0.8),
            _darkFillColor,
          ),
          contentTextStyle: textTheme.subtitle2!.apply(color: _lightFillColor),
        ),
        textTheme: _textTheme,
      );
}
