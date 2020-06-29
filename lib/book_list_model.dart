import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchBooks() async {
    final docs = await Firestore.instance.collection('books').getDocuments();
    //final books = docs.documents.map((doc) => Book(doc['title']));
    this.books = docs.documents.map((doc) => Book(doc['title'])).toList();
    notifyListeners();
  }
}
