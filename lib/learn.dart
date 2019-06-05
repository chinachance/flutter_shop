import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///tab1
class LearnPage extends StatelessWidget {
  const LearnPage() : super();

  void shoToast(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          _CustomListItem(
            //GestureDetector 点击事件需要用GestureDetector在外边包裹,然后在onTap执行点击操作
            thumbnail: GestureDetector(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                foregroundDecoration: BoxDecoration(color: Colors.pink),
              ),
              onTap: shoToast,
            ),
            title: 'shop',
            subtitle:
            'Flutter continues to improve and expand its horizons.This text should max out at two lines and clip',
            author: 'hao',
            publishDate: '2019-6-4',
            readDuration: '5 mins',
          ),
          _CustomListItem(
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: 'shop',
            subtitle: 'Flutter once again improves and makes updates.',
            author: 'hao',
            publishDate: '2019-6-4',
            readDuration: '5 mins',
          )
        ],

      ),
    );
  }
}

///图片右边的文件描述组件
class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12.0, color: Colors.black54),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate · $readDuration ★',
                style: const TextStyle(fontSize: 12.0, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomListItem extends StatelessWidget {
  _CustomListItem({Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration})
      : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
