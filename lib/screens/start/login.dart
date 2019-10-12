import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../Lang.dart';
import '../../Memory.dart';
import '../../widgets/eText.dart';
import '../../contsants/AppTheme.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    AppTheme theme = Memory.theme;

    return Scaffold(
        backgroundColor: theme.splashScreen,
        body: Container(
          child: Center(
            child: eText("login"),
          )
        )
    );
  }

}