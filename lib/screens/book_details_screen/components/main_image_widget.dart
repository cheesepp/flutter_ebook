import 'package:flutter/material.dart';

class MainImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'http://papers.co/wallpaper/papers.co-sa52-blurred-white-blur-wallpaper-4-wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
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
                  'https://images-na.ssl-images-amazon.com/images/I/71d2WrAUznL.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
      );
}
