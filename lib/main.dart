import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_demo/page/home.dart';
import 'package:flutter_my_demo/route/application.dart';
import 'package:flutter_my_demo/route/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp() {
    //初始化路由
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashPage(),
      //初始化路由
      onGenerateRoute: Application.router.generator,
    );
  }
}

class MySplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<MySplashPage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation _animation;

  @override
  void dispose() {
    //页面销毁时
    _controller.dispose();
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
//    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
//      Navigator.of(context).pushAndRemoveUntil(
//          new MaterialPageRoute(
//              //跳转到主页
//              builder: (BuildContext context) => new HomePage()),
//          (Route route) => route == null);
//      return true;
//    });
    _controller =
        AnimationController(
            vsync: this, duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //路由跳转
        Application.router.navigateTo(
            context, "/home", transition: TransitionType.fadeIn);
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context) => HomePage()),
//                (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
      child: new Image.asset(
        "images/splash.jpg",
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    ));
  }
}
