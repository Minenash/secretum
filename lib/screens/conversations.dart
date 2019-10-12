import 'package:flutter/material.dart';
import '../Memory.dart';
import '../widgets/eText.dart';
import '../contsants/AppTheme.dart';

class ConversationScreen extends StatefulWidget {
  ConversationScreen({Key key}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {

  @override
  Widget build(BuildContext context) {

    AppTheme theme = Memory.theme;

    return Scaffold(
        backgroundColor: theme.background,
        appBar: AppBar(
          backgroundColor: theme.appbar,
          title: Text("Secretum"),
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
            child: CircleAvatar(
              backgroundColor: theme.background,
              foregroundColor: theme.primary,
              child: eText("EX", weight: FontWeight.bold),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.create),
          backgroundColor: theme.appbar,
        ),
        bottomNavigationBar: BottomAppBar(
            color: theme.appbar,
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.archive, color: theme.secondary),
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: theme.secondary),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert, color: theme.secondary),
                    ),
                  ],
                ),
              ],
            )
        ),
        body: Container(
          width: double.maxFinite,
          child: ListView(
            children: <Widget>[
              getItem("Michael", "M", "Hey old pal", "3 HOURS", 2),
              getItem("Ryan C.", "RC", "What about tomorrow", "5 MIN", 1),
              getItem("Dad", "KT", "Take out the garabage", "MON", 0),
              getItem("Gabriel", "G", "Okay", "SUN", 0),
              getItem("Anthony", "A", "Goodnight", "SAT", 2),
            ],
          ),
        )
    );
  }

  Widget getItem(String name, String initials, String msg, String time, int status) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.cyan[800],
              foregroundColor: Colors.white,
              child: eText(initials, weight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                eText(name, size: 16, weight: FontWeight.bold),
                eText(msg, size: 14),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                eText(time, size: 12, weight: FontWeight.bold),
                status == 0? Container() : Icon(status == 1? Icons.done : Icons.done_all, color: Memory.theme.primary)
              ],
            )
          ],
        ),
      ),
    );
  }
}