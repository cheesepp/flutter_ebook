import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_book/const/title_text.dart';
import 'package:flutter_book/screens/home_screen/components/categories_page.dart';
import 'package:flutter_book/services/fetch_data.dart';
import 'package:flutter_book/widgets/books_listview.dart';
import 'package:flutter_book/widgets/grid_dashboard.dart';
import 'package:flutter_book/widgets/images_slider.dart';
import 'dart:convert';

import 'package:flutter_book/widgets/main_drawer.dart';

import 'components/main_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(
          key: key,
        );

  static const routeName = '/home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var _homeScaffoldKey = GlobalKey<ScaffoldState>();
  var fetch = FetchData();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      key: _homeScaffoldKey,
      drawer: const MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _homeScaffoldKey.currentState?.openDrawer();
                        },
                        icon: const ImageIcon(
                          AssetImage("assets/images/drawer.png"),
                          color: Colors.black,
                        ),
                      ),
                      TabBar(
                          labelPadding:
                              const EdgeInsets.only(left: 20, right: 20),
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: _CircleTabIndicator(
                              color: Colors.black, radius: 4),
                          tabs: [
                            Tab(text: "Trang chủ"),
                            Tab(text: "Thể loại"),
                          ]),

                      IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      // Text(widget.value.toString())
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              MainPage(fetch: fetch),
              const CategoriesPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  _CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
