import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          TitleText.headlineLarge(context, text: 'home_main_page'.tr),
          const SizedBox(
            height: 30,
          ),
          const ImagesSlider(),
          const SizedBox(
            height: 50,
          ),
          TitleText.headlineMedium(context, text: 'home_popular'.tr),
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
          TitleText.headlineMedium(context, text: 'home_recently_release'.tr),
          Container(
            height: 300,
            width: double.infinity,
          ),
          TitleText.headlineMedium(context, text: 'home_most_fav'.tr),
        ],
      ),
    );
  }
}
