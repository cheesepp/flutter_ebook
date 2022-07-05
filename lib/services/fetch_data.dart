import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_book/models/book.dart';

class FetchData {
  List info = [];
  List<Book> books = [];
  _initData(BuildContext context) async {
    await DefaultAssetBundle.of(context)
        .loadString("json/books.json")
        .then((value) {
      info = json.decode(value);
    });
  }

  fetchBooks(BuildContext context) async {
    await _initData(context);
    info.forEach((element) {
      Book book = Book.fromJson(element);
      books.add(book);
    });
  }
}
