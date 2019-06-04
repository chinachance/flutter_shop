import 'package:flutter/material.dart';

import 'learn.dart';

class HomePage extends StatelessWidget {
  HomePage() : super();

  static const String _title = 'flutter shop';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: TabPage(),
    );
  }
}

class TabPage extends StatefulWidget {
  TabPage({Key key}) : super(key: key);

  @override
  _MyTabStetefulWidgetState createState() => _MyTabStetefulWidgetState();
}

class _MyTabStetefulWidgetState extends State<TabPage> {
  int _selectIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LearnPage(),
    Text(
      'Index 1: Message',
      style: optionStyle,
    ),
    Text(
      'Index 2: Me',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("learn")),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text("message")),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), title: Text("me"))
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
