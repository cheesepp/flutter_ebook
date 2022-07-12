import 'package:flutter/material.dart';
import 'package:flutter_book/screens/book_details_screen/components/main_image_widget.dart';
import 'package:flutter_book/services/theme_service.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../models/book.dart';

class BookDetailsScreen extends StatefulWidget {
  BookDetailsScreen({Key? key, required this.book}) : super(key: key);
  Book book;
  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;
  int _currentIndex = 0;
  void onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  final panelController = PanelController();
  final double tabBarHeight = 80;
  @override
  Widget build(BuildContext context) {
    // final images = ['assets/images/test1.jpg', 'assets/images/test2.jpg'];
    _scale = 1 - _controller!.value;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: panelController,
            maxHeight: MediaQuery.of(context).size.height - 100,
            panelBuilder: (scrollController) => buildSlidingPanel(
              scrollController: scrollController,
              panelController: panelController,
            ),
            body: MainImageWidget(widget.book.images, onPageChange),
          ),
          Positioned(
            bottom: 70,
            left: 20,
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              child: Transform.scale(
                scale: _scale!,
                child: _animatedButtonUI('detail_cart_btn'.tr, () {
                  print('clicked add to cart button!');
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            right: 20,
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              child: Transform.scale(
                scale: _scale!,
                child: _animatedButtonUI('detail_buy_btn'.tr, () {}),
              ),
            ),
          ),
          Positioned(
            left: 80,
            right: 0,
            bottom: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 50,
                child: Container(
                  margin: const EdgeInsets.only(left: 80),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.book.images.length,
                      itemBuilder: (context, index) {
                        return buildIndicator(
                          index == _currentIndex,
                        );
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSlidingPanel({
    required PanelController panelController,
    required ScrollController scrollController,
  }) =>
      Scaffold(
        body: Stack(children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: panelController.open, child: buildDragIcon()),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 150),
                child: Text('pro',
                    style: TextStyle(fontSize: 20),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ]),
      );

  Widget buildDragIcon() => Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 40,
        height: 8,
      );

  Widget _animatedButtonUI(String text, VoidCallback onClick) =>
      GestureDetector(
        onTap: onClick,
        child: Container(
          height: 55,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x80000000),
                  blurRadius: 30.0,
                  offset: Offset(0.0, 5.0),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: !ThemeService.hasDarkMode()
                    ? [
                        Color(0xFFFCF8E8),
                        Color(0xFFF9F9F9),
                      ]
                    : const [Color(0xff504135), Color(0xffeae9ee)],
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller!.reverse();
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: isActive ? 13 : 12,
      decoration: BoxDecoration(
          color: ThemeService.hasDarkMode()
              ? isActive
                  ? Colors.grey
                  : Colors.black
              : isActive
                  ? Colors.black
                  : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
          ]),
    );
  }
}
