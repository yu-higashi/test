import 'package:flutter/material.dart';
import 'package:flutterapp/domain/Book.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    final bool isCreate = book == null;
    final textEditingController = TextEditingController();
    if (!isCreate) {
      textEditingController.text = book.title;
    }

    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(isCreate ? "本追加" : "本を更新"),
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
                    controller: textEditingController,
                    onChanged: (text) {
                      model.bookTitle = text;
                    },
                  ),
                  RaisedButton(
                    child: Text(isCreate ? '追加する' : '更新する'),
                    onPressed: () async {
                      if (isCreate) {
                        await addBook(context, model);
                      } else {
                        await updateBook(context, model);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future addBook(BuildContext context, AddBookModel model) async {
    try {
      await model.addBookToFirebase();

      await _showDialog(context, '追加しました！');
      Navigator.of(context).pop();
    } catch (e) {
      await _showDialog(context, e.toString());
    }
  }

  Future updateBook(BuildContext context, AddBookModel model) async {
    try {
      await model.updateBook(book);

      await _showDialog(context, "更新しました！");
      Navigator.of(context).pop();
    } catch (e) {
      await _showDialog(context, e.toString());
    }
  }

  Future _showDialog(BuildContext context, String body) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(body),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
