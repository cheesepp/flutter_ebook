import 'package:flutter/material.dart';
import 'package:flutter_book/screens/book_details_screen/components/main_image_widget.dart';
import 'package:flutter_book/services/theme_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen>
    with SingleTickerProviderStateMixin {
  double? _scale;
  AnimationController? _controller;
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
            body: MainImageWidget(),
          ),
          Positioned(
            bottom: 70,
            left: 20,
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              child: Transform.scale(
                scale: _scale!,
                child: _animatedButtonUI('Add to cart'),
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
                child: _animatedButtonUI('Buy now'),
              ),
            ),
          ),
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
                child: Text('Computer Programming',
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

  Widget _animatedButtonUI(String text) => Container(
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
      );

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller!.reverse();
  }
}
