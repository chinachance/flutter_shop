import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_my_demo/page/learn.dart';
import 'package:flutter_my_demo/model/message_bean_entity.dart';
import 'dart:convert';
import 'package:flutter_my_demo/utils/dateFormat/date_format.dart';

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
        itemCount:
            (messageBeanEntity == null || messageBeanEntity.articles == null)
                ? 0
                : messageBeanEntity.articles.length,
        itemBuilder: (context, item) {
          ///时间
          var dateTime = DateTime.fromMillisecondsSinceEpoch(
              messageBeanEntity.articles[item].shownTime *1000);

          print(dateTime);
          ///与当前时间的间隔
          String diffTime = dateDiffFormat(dateTime);
          return Column(
//            children: <Widget>[Text(messageBeanEntity.articles[item].title)],
            children: <Widget>[
              CustomListItem(
                //GestureDetector 点击事件需要用GestureDetector在外边包裹,然后在onTap执行点击操作
                thumbnail: GestureDetector(
                  child: Image.network(
                    messageBeanEntity.articles[item].avatar,
                    width: 300.0,
                    height: 300.0,
                  ),
//                  onTap: ,
                ),
                title: messageBeanEntity.articles[item].title,
                subtitle: messageBeanEntity.articles[item].desc,
                author: messageBeanEntity.articles[item].nickname,
                publishDate: formatDate(dateTime, [yyyy,"-",mm,"-",dd,"   ",HH, ':', nn]),
                readDuration: diffTime,
              ),
            ],
          );
        },
      ),
    );
  }

  ///选中此页面时刷新页面
  @override
  bool get wantKeepAlive => true;

  String dateDiffFormat(DateTime date) {
    var difference = new DateTime.now().difference(date);
    if (difference.inHours >= 1) {
      return difference.inHours.toString() + "小时前";
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes.toString() + "分钟前";
    } else if (difference.inSeconds >= 1) {
      return difference.inSeconds.toString() + "秒前";
    }
    return "";
  }
}
