import 'package:flutter/material.dart';

import '../../../const/title_text.dart';
import '../../../services/fetch_data.dart';
import '../../../widgets/books_listview.dart';
import '../../../widgets/images_slider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.fetch,
  }) : super(key: key);

  final FetchData fetch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText.headlineLarge(context, text: 'Trang Chủ'),
          const SizedBox(
            height: 30,
          ),
          const ImagesSlider(),
          const SizedBox(
            height: 50,
          ),
          TitleText.headlineMedium(context, text: 'Phổ biến'),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: fetch.fetchBooks(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return BooksListView(fetch: fetch);
                }
              }),
          const SizedBox(
            height: 20,
          ),
          TitleText.headlineMedium(context, text: 'Mới phát hành'),
          Container(
            height: 300,
            width: double.infinity,
          ),
          TitleText.headlineMedium(context, text: 'Nhiều lượt thích'),
        ],
      ),
    );
  }
}
