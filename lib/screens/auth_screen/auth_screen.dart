import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book/screens/auth_screen/components/singin_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../widgets/circular_tab_indicator.dart';
import 'components/signup_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
    print('rebuilt ${_tabController.index}');
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Lottie.asset(
                          "assets/lotties/auth.json",
                          height: size.height * 0.30,
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
                          indicator: CircleTabIndicator(
                              color: Colors.black, radius: 4),
                          tabs: [
                            Tab(
                              text: 'Sign In',
                            ),
                            Tab(text: "Sign Up"),
                          ]),

                      // Text(widget.value.toString())
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              SignInPage(
                onClicked: () => _tabController.animateTo(1),
              ),
              SignUpPage(),
            ],
          ),
        ),
      ),
    );
  }
}
