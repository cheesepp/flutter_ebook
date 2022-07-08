import 'package:flutter_book/services/resource_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/book.dart';

class API {
  dynamic booksjson = 0;
  String baseUrl = 'https://ebook-mockdata-default-rtdb.firebaseio.com/';
  List<Book> books = [];
  Future fetchAllBooks() async {
    final url = Uri.parse(baseUrl + '/books.json');
    try {
      final response = await http.get(url);
      booksjson = json.decode(response.body) as Map<String, dynamic>;
      booksjson.forEach((key, value) {
        Book book = Book.fromJson(value);
        books.add(book);
      });
      // booksjson.forEach((prodId, prodData) {
      //   books.add(Book.fromJson(prodData));
      // });
    } catch (e) {
      print(booksjson);
      print(e);
    }
  }
}
