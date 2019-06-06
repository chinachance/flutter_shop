import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_my_demo/page/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashPage(),
    );
  }
}

class MySplashPage extends StatefulWidget {
  MySplashPage() : super();

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State {
//  Timer timer;

  @override
  void dispose() {
    //页面销毁时
//    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //首次调用,只调用一次
//    timer = new Timer(const Duration(milliseconds: 1500), () {
//      //定时器完成时的回调
//      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
//          builder: (BuildContext context) => new homePage()), ( //跳转到主页
//          Route route) => route == null);
//    });
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              //跳转到主页
              builder: (BuildContext context) => new HomePage()),
          (Route route) => route == null);
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
      child: new Image.asset("images/splash.jpg"),
    ));
  }
}
