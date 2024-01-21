import 'package:flutter/material.dart';
import 'package:flutter_book/const/title_text.dart';
import 'package:flutter_book/widgets/cart_item_widget.dart';
import 'package:flutter_book/widgets/main_drawer.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  static const routeName = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                    icon: const ImageIcon(
                      AssetImage("assets/images/drawer.png"),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            TitleText.headlineLarge(context, text: 'Giỏ Hàng'),
            const SizedBox(
              height: 20,
            ),
            CartItemWidget(),
          ],
        ),
      ),
    );
  }
}
