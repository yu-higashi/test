import 'package:flutter/material.dart';
import 'package:flutterapp/book_list_model.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("BookList"),
          actions: <Widget>[
            Icon(Icons.add),
            Icon(Icons.share),
          ],
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            final listTiles = books
                .map(
                  (book) => ListTile(
                    title: Text(book.title),
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
      ),
    );
  }
}