import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_book/const/title_text.dart';

import '../../../api/books_api.dart';
import '../../../models/book.dart';
import '../../../widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await API().searchBooks(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    TitleText.headlineLarge(context,
                        text: 'Search', padding: 5),
                  ],
                ),
                buildSearch(),
                Expanded(
                  child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return buildBook(book);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final books = await API().searchBooks(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books;
        });
      });

  Widget buildBook(Book book) => ListTile(
        leading: AspectRatio(
          aspectRatio: 2 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              book.images[0],
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        title: Text(
          book.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(book.author!),
      );
}
