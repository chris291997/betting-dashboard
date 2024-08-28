part of '../theme.dart';

class AppTextStyle {
  const AppTextStyle._({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.headline6,
    required this.subtitle1,
    required this.subtitle2,
    required this.bodyText1,
    required this.bodyText2,
    required this.caption,
    required this.overLine,
    required this.button,
  });

  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle headline6;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle bodyText1;
  final TextStyle bodyText2;
  final TextStyle caption;
  final TextStyle overLine;
  final TextStyle button;

  static const _fontFamily = 'Outfit';

  factory AppTextStyle.defaultTextStyle() {
    return const AppTextStyle._(
      headline1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 96.0,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 60.0,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Colors.white,
      ),
      headline3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 48.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 34.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      subtitle2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      overLine: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      button: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
