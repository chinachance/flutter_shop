import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  homePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hahaa"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Row(
          children: [
            new Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new Text("123"),
            ),
            new Icon(
              Icons.star,
              color: Colors.red,
            ),
            new Text("41")
          ],
        ),
      ),
    );
  }
}
