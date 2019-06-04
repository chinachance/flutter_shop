import 'package:flutter/material.dart';

///tab1
class LearnPage extends StatelessWidget {
  const LearnPage() : super();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:,
    );
  }
}

class _LearnList extends StatelessWidget {

  _LearnList({
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
    // TODO: implement build
    return null;
  }

}
