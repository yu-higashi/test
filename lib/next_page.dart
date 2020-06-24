import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String name;
  NextPage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NextPage"),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(name),
            Center(
              child: RaisedButton(
                child: Text("前へ"),
                onPressed: () {
                  Navigator.pop(context, "POCHIさんすごい!!");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
