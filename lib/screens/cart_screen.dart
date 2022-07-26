import 'package:flutter/material.dart';
import 'package:flutter_book/const/title_text.dart';
import 'package:flutter_book/providers/cart_provider.dart';
import 'package:flutter_book/services/books_service.dart';
import 'package:flutter_book/widgets/cart_item_widget.dart';
import 'package:flutter_book/widgets/main_drawer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../services/theme_service.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  static const routeName = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartScaffoldKey = GlobalKey<ScaffoldState>();
  List<String> productImages = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    productImages = BooksService()
        .getBookImage(Provider.of<CartProvider>(context).items.keys.toList());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      key: _cartScaffoldKey,
      drawer: const MainDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () =>
                        _cartScaffoldKey.currentState?.openDrawer(),
                    icon: ImageIcon(
                      const AssetImage("assets/images/drawer.png"),
                      color: ThemeService().theme == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                TitleText.headlineLarge(context, text: 'cart'.tr),
                const SizedBox(
                  width: 50,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    print("You pressed Icon Elevated Button");
                  },
                  icon: Icon(Icons.clear_all), //icon data for elevated button
                  label: Text("Clear all"), //label text
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // background
                    onPrimary: const Color(0xff1C1A1A),
                    // fixedSize: Size(50, 35),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                // Container(
                //   width: 50,
                //   height: 20,
                //   padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.clear_all,
                //         color: Colors.black,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Clear all',
                //         style: TextStyle(fontSize: 5, color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            cart.items.length == 0
                ? const Expanded(
                    child: Center(
                      child: Text('Let\'s shopping!'),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                            cart: cart.items.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: cart.items.length),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          letterSpacing: 4),
                    ),
                    Text(
                      cart.totalAmount.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 23),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'ORDER NOW',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 30,
                    fixedSize: const Size(155, 65),
                    primary: const Color(0xff1C1A1A), // background
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // foreground
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
