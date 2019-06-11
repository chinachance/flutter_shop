import 'package:flutter/material.dart';
import 'package:flutter_my_demo/page/me.dart';
import 'package:flutter_my_demo/page/message.dart';
import 'learn.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_my_demo/app_config.dart';

class HomePage extends StatelessWidget {
  HomePage() : super();

  static const String _title = 'flutter shop';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: defaultConfig.appName,
      theme: defaultConfig.theme,
      showPerformanceOverlay: defaultConfig.showPerformanceOverlay,
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
    MessagePage(),
    MePage()
  ];

  @override
  initState() {
    super.initState();
    requestPermiss();
  }

  requestPermiss() async {
    //请求权限
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler()
        .requestPermissions([PermissionGroup.location, PermissionGroup.camera]);
    //校验权限
    if (permissions[PermissionGroup.camera] != PermissionStatus.granted) {
      print("无照相权限");
    }
    if (permissions[PermissionGroup.location] != PermissionStatus.granted) {
      print("无定位权限");
    }
  }

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
