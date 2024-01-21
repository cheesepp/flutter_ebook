import 'package:flutter/material.dart';
import 'package:flutter_book/services/fetch_data.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({
    Key? key,
    required this.fetch,
  }) : super(key: key);

  final FetchData fetch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 29, right: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 7,
                      offset: const Offset(5, 5),
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      // "assets/images/0.jfif",
                      fetch.books[index].images[0],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  fetch.books[index].name,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
