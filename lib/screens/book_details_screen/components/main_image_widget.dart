import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/theme_service.dart';

class MainImageWidget extends StatefulWidget {
  MainImageWidget(this.image, this.onTap);
  List<dynamic> image;
  Function(int currentIndex) onTap;

  @override
  State<MainImageWidget> createState() => _MainImageWidgetState();
}

class _MainImageWidgetState extends State<MainImageWidget> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ThemeService.hasDarkMode()
                ? 'assets/images/dark_background.jpg'
                : 'assets/images/light_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  widget.onTap(index);
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.55,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(20),
                    //   boxShadow: <BoxShadow>[
                    //     BoxShadow(
                    //       color: Colors.black.withOpacity(0.3),
                    //       blurRadius: 7,
                    //       offset: const Offset(5, 5),
                    //       spreadRadius: 3,
                    //     ),
                    //   ],
                    // ),
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          // "assets/images/0.jfif",
                          widget.image[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      );
}
