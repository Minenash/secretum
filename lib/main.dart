import 'package:flutter/material.dart';
import 'Memory.dart';
import 'widgets/eText.dart';
import 'contsants/AppTheme.dart';
import 'screens/conversations.dart';
import 'package:secretum/screens/start/start.dart';
import 'package:secretum/screens/start/privacy.dart';
import 'package:secretum/screens/start/login.dart';
import 'package:secretum/screens/start/register.dart';
import 'Lang.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secretum',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/start':          (context) => new StartScreen(),
        '/start/privacy':  (context) => new PrivacyScreen(),
        '/start/login':    (context) => new ConversationScreen(),
        '/start/register': (context) => new RegisterScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Memory.loadPreferences(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return StartScreen();
        else
          return Container();
      }
     );

  }
}
