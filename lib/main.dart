import 'package:flutter/material.dart';
import 'package:flutter_book/screens/cart_screen.dart';
import 'package:flutter_book/screens/category_items.dart';
import 'package:flutter_book/screens/e_wallet_screen.dart';
import 'package:flutter_book/screens/home_screen/home_screen.dart';
import 'package:flutter_book/screens/test.dart';
import 'package:flutter_book/widgets/main_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffF6FBF4),
        fontFamily: 'CharisSIL',
      ),
      home: EWalletScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        EWalletScreen.routeName: (ctx) => const EWalletScreen()
        //       OrderScreen.routeName: (ctx) => OrderScreen(),
        //       UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        //       EditProductScreen.routeName: (ctx) => EditProductScreen(),
      },
    );
  }
}
