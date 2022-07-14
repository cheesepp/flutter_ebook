import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_book/const/title_text.dart';
import 'package:flutter_book/screens/home_screen/components/search_page.dart';
import 'package:flutter_book/screens/home_screen/components/categories_page.dart';
import 'package:flutter_book/services/books_service.dart';
import 'package:flutter_book/services/fetch_data.dart';
import 'package:flutter_book/services/resource_service.dart';
import 'package:flutter_book/widgets/books_listview.dart';
import 'package:flutter_book/widgets/grid_dashboard.dart';
import 'package:flutter_book/widgets/images_slider.dart';
import 'dart:convert';

import 'package:flutter_book/widgets/main_drawer.dart';
import 'package:get/get.dart';

import '../../api/books_api.dart';
import '../../services/theme_service.dart';
import '../../widgets/circular_tab_indicator.dart';
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
  var booksService = BooksService();
  bool hasDownloaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booksService.api.baseUrl = ResourceService().getResource() ??
        'https://ebook-mockdata-default-rtdb.firebaseio.com/';
  }

  @override
  void didChangeDependencies() async {
    hasDownloaded = false;
    print(hasDownloaded);
    await booksService.fetchData();
    print(hasDownloaded);
    setState(() {
      hasDownloaded = true;
    });
    super.didChangeDependencies();
  }

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
                        onPressed: () =>
                            _homeScaffoldKey.currentState?.openDrawer(),
                        icon: ImageIcon(
                          const AssetImage("assets/images/drawer.png"),
                          color: ThemeService().theme == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      TabBar(
                          labelPadding:
                              const EdgeInsets.only(left: 20, right: 20),
                          controller: _tabController,
                          labelColor: ThemeService().theme == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: CircleTabIndicator(
                              color: ThemeService().theme == ThemeMode.dark
                                  ? Colors.white
                                  : Colors.black,
                              radius: 4),
                          tabs: [
                            Tab(
                              text: "home_main_page".tr,
                            ),
                            Tab(text: "home_categories".tr),
                          ]),

                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SearchPage()))),
                        icon: Icon(
                          Icons.search,
                          color: ThemeService().theme == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      // Text(widget.value.toString())
                    ],
                  ),
                ),
              ),
            ];
          },
          body: hasDownloaded
              ? TabBarView(
                  controller: _tabController,
                  children: [
                    MainPage(
                      booksService: booksService,
                    ),
                    const CategoriesPage(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
