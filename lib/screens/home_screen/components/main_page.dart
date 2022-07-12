import 'package:flutter/material.dart';
import 'package:flutter_book/services/books_service.dart';
import 'package:get/get.dart';

import '../../../api/books_api.dart';
import '../../../const/title_text.dart';
import '../../../models/book.dart';
import '../../../services/fetch_data.dart';
import '../../../widgets/books_listview.dart';
import '../../../widgets/images_slider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.booksService,
  }) : super(key: key);

  final BooksService booksService;

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
          BooksListView(fetch: booksService.getPopularBooks()),
          const SizedBox(
            height: 50,
          ),
          TitleText.headlineMedium(context, text: 'home_recently_release'.tr),
          const SizedBox(
            height: 20,
          ),
          BooksListView(fetch: booksService.getRecentlyReleaseBooks()),
          const SizedBox(
            height: 50,
          ),
          TitleText.headlineMedium(context, text: 'home_most_fav'.tr),
          const SizedBox(
            height: 20,
          ),
          BooksListView(fetch: booksService.getMostFavoriteBooks()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/get_all_book.png',
                width: 250,
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('See all books'),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
