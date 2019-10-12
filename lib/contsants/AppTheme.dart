import 'package:flutter/material.dart';
import 'sColors.dart';

class AppTheme {

  final String name;

  final Color primary;
  final Color secondary;
  final Color background;

  final Color splashScreen;
  final Color appbar;

  const AppTheme._({this.name, this.primary, this.secondary, this.background,
                    this.appbar, this.splashScreen,
  });

  static AppTheme fromString(String name) {
    return name == "dark"? dark : light;
  }

  static const AppTheme light = AppTheme._(
    name: "light",

    primary: sColors.off_black,
    secondary: Colors.white,
    background: sColors.off_light,

    appbar: sColors.off_black,
    splashScreen: sColors.off_light,
  );

  //TODO: Dark Theme
  static const AppTheme dark = AppTheme._(
    name: "dark",

    primary: sColors.off_light,
    secondary: sColors.off_light,
    background: sColors.dark_black,

    appbar: sColors.off_black,
    splashScreen: sColors.off_black,
  );
}