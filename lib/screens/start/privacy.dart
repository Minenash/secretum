import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../Lang.dart';
import '../../Memory.dart';
import '../../widgets/eText.dart';
import '../../contsants/AppTheme.dart';

class PrivacyScreen extends StatefulWidget {
  PrivacyScreen({Key key}) : super(key: key);

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {

  @override
  Widget build(BuildContext context) {
    AppTheme theme = Memory.theme;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        backgroundColor: theme.appbar,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: Text(Lang.trans('privacy_title')),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.open_in_browser),
          )
        ],
      ),
    );
  }
}