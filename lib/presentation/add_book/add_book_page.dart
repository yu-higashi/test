import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("本追加"),
          actions: <Widget>[
            Icon(Icons.add),
            Icon(Icons.share),
          ],
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      model.bookTitle = text;
                    },
                  ),
                  RaisedButton(
                    child: Text('追加する'),
                    onPressed: () async {
                      await model.addBookToFirebase();
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
