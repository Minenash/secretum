import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../Lang.dart';
import '../../Memory.dart';
import '../../widgets/eText.dart';
import '../../contsants/AppTheme.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  Widget build(BuildContext context) {

    AppTheme theme = Memory.theme;

    return Scaffold(
        backgroundColor: theme.splashScreen,
        body: Container(
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 180),
                  eText("Secretum", size: 38, weight: FontWeight.bold),
                  Spacer(),
                  OutlineButton(
                    onPressed: () => Navigator.pushNamed(context, '/start/login'),
                    child: Container(
                        width: 125,
                        child: eText(Lang.trans('start_login_button'), size: 16, align: TextAlign.center)
                    ),
                    borderSide: BorderSide(color: theme.primary),
                  ),
                  SizedBox(height: 8),
                  OutlineButton(
                    onPressed: () => Navigator.pushNamed(context, '/start/register'),
                    child: Container(
                        width: 125,
                        child: eText(Lang.trans('start_register_button'), size: 16, align: TextAlign.center)
                    ),
                    borderSide: BorderSide(color: theme.primary),
                  ),
                  SizedBox(height: 180),
                ],
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/start/privacy');
                    },
                    child: eText(Lang.trans("start_privacy_button"))
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: getOptionWidget(),
              )
            ],
          )
        )
    );
  }

  int menu_state = 0;
  Widget getOptionWidget() {

    AppTheme theme = Memory.theme;

    switch (menu_state) {
      case 0: return IconButton(
          icon: Icon(Icons.settings),
          color: theme.primary,
          onPressed: () {setState(() {
            menu_state = 1 ;
          });}
      );
      
      case 1: return Column(
        children: <Widget>[
          IconButton(
              color: theme.primary,
              icon: Icon(MdiIcons.themeLightDark),
              onPressed: () => switchTheme(),
          ),
          IconButton(
              color: theme.primary,
              icon: Icon(Icons.language),
              onPressed: () {setState(() {
                menu_state = 2;
              });}
          ),
          IconButton(
            color: theme.primary,
            icon: Icon(Icons.arrow_back),
            onPressed: () {setState(() {
              menu_state = 0;
            });}
          )
        ],
      );
      
      case 2: return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            child: eText("ᴇɴ - English"),
            onPressed: () => setLanguage("en"),
          ),
          FlatButton(
            child: eText("ᴇs - Español"),
            onPressed: () => setLanguage("es"),
          ),
          FlatButton(
            child: eText("ᴅᴇ - Deutsche"),
            onPressed: () => setLanguage("de"),
          ),
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {setState(() {
                menu_state = 1;
              });}
          )
        ],
      );
    }
  }

  void switchTheme() {
    setState(() {
      bool toLight = Memory.theme == AppTheme.dark;
      Memory.theme = toLight? AppTheme.light : AppTheme.dark;
      Memory.saveTheme(toLight);
      menu_state = 0;
    });
  }

  void setLanguage(String code) {
    setState(() {
      Lang.setLang(code);
      menu_state = 0;
    });
  }


}