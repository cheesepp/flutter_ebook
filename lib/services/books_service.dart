import 'package:flutter_book/api/books_api.dart';

import '../models/book.dart';

class BooksService {
  final api = API();
  int isSmaller(int? a, int? b) {
    if (a! < b!) {
      return 1;
    }
    return -1;
  }

  static List<Book> books = [];
  bool hasDownloaded = false;
  Future fetchData() async {
    await api.fetchAllBooks();
    books.addAll(api.books);
    hasDownloaded = true;
  }

  List<Book> getPopularBooks() {
    books.sort((first, next) => isSmaller(first.purchases, next.purchases));
    final popularBooks = books.sublist(0, 3);
    print(popularBooks);
    return popularBooks;
  }

  List<Book> getRecentlyReleaseBooks() {
    books.sort((first, next) =>
        isSmaller(first.yearOfPublishcation, next.yearOfPublishcation));
    final popularBooks = books.sublist(0, 3);
    print(popularBooks);
    return popularBooks;
  }

  List<Book> getMostFavoriteBooks() {
    books.sort((first, next) =>
        isSmaller(first.numberOfFavorite, next.numberOfFavorite));
    final mostFavoriteBooks = books.sublist(0, 3);
    return mostFavoriteBooks;
  }
}
