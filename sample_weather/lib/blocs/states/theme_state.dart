part of '../theme_bloc.dart';

class ThemeState extends Equatable {

  final ThemeData themeData;
  final MaterialColor color;

  ThemeState({this.themeData, this.color});

  @override
  List<Object> get props => [themeData, color];
}