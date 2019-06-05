import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_my_demo/model/message_bean_entity.dart';
import 'dart:convert';


class MessagePage extends StatefulWidget {
  const MessagePage() : super();

  @override
  _MessageState createState() {
    return _MessageState();
  }
}

class _MessageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  String url = "https://www.csdn.net/api/articles?type=new&category=home";
  var messageBeanEntity = new MessageBeanEntity();

  Future request() async {
    Dio dio = new Dio();
    print("network");
    Response response = await dio.get(url).then((r) {
      setState(() {
        //第一种解析写法
//    Map msgMap = json.decode(r.toString());
//    var messageBeanEntity = new MessageBeanEntity.fromJson(msgMap);
        //第二种解析写法
        messageBeanEntity = MessageBeanEntity.fromJson(r.data);
      });
    }).catchError(print);
    print(response);
  }

  @override
  void initState() {
    super.initState();
    request();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: messageBeanEntity.articles.length,
        itemBuilder: (context, item) {
          return Column(
            children: <Widget>[Text(messageBeanEntity.articles[item].title)],
          );
        },
      ),
    );
  }

  ///选中此页面时刷新页面
  @override
  bool get wantKeepAlive => true;


}
