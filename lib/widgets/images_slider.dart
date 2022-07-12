import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 1),
                      blurRadius: 7,
                      spreadRadius: 1)
                ],
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const Image(
                  image: NetworkImage(
                      'https://static.remove.bg/remove-bg-web/5c20d2ecc9ddb1b6c85540a333ec65e2c616dbbd/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg'),
                  fit: BoxFit.cover,
                ),
              )),
        );
      },
    );
  }
}
