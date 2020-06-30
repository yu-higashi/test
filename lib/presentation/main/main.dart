import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../book_list/book_list_page.dart';
import 'main_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "aaaaaaaaa",
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("コリアンダー"),
            actions: <Widget>[
              Icon(Icons.add),
              Icon(Icons.share),
            ],
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    model.pochiText,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  RaisedButton(
                    child: Text('ボタン'),
                    onPressed: () {
                      //model.changePochiText();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookListPage()),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
