import 'package:fluro/fluro.dart';
/// @Author: 一凨
/// @Date: 2019-01-14 17:53:54
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 17:57:51

import 'package:flutter/material.dart';
import 'package:flutter_my_demo/page/webview.dart';
import 'package:flutter_my_demo/route/application.dart';
import 'package:flutter_my_demo/route/routes.dart';

//import '../routers/application.dart';
//import '../routers/routers.dart';
import 'dart:core';

import 'package:fluttertoast/fluttertoast.dart';

class ListViewItem extends StatelessWidget {
  final String itemUrl;
  final String itemTitle;
  final String data;

  const ListViewItem({Key key, this.itemUrl, this.itemTitle, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          //item跳转
//          String route = '/web?url=${Uri.encodeComponent(itemUrl)}&title=${Uri.encodeComponent(itemTitle)}';
//          Application.router.navigateTo(context, route,transition: TransitionType.fadeIn);
          Application.router.navigateTo(context,
              '${Routes.web}?title=${Uri.encodeComponent(itemTitle)}&url=${Uri
                  .encodeComponent(itemUrl)}',
              transition: TransitionType.fadeIn).then((result) {
            if (result == "key") {
              //执行func路由,func路由为弹出弹窗
              Application.router.navigateTo(
                  context, "/demo/func?message=$result");
            }
          });
//          Navigator.of(context).push(
//              new MaterialPageRoute(
//                  //跳转到主页
//                  builder: (BuildContext context) => new WebViewPage(itemUrl,itemTitle)));
        },
        title: Padding(
          child: Text(
            itemTitle,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(data,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}
