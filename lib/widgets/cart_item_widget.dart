import 'package:flutter/material.dart';
import 'package:flutter_book/services/books_service.dart';
import 'package:get/get.dart';

import '../models/cart.dart';
import '../services/theme_service.dart';

class CartItemWidget extends StatefulWidget {
  CartItemWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);
  Cart cart;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          // margin: const EdgeInsets.only(left: 30),
          height: 250,
          width: MediaQuery.of(context).size.width * 9,
          child: Stack(
            children: [
              Positioned(
                  left: 32,
                  top: 35,
                  child: Container(
                    height: 180.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: ThemeService().theme == ThemeMode.dark
                          ? const Color(0xff121212)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(6.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 4.0),
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(-6.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 4.0),
                      ],
                    ),
                    // child: Text("This is where your content goes")
                  )),
              Positioned(
                  top: 0,
                  left: 10 + 32,
                  child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(widget.cart.image!),
                            ),
                          )))),
              Positioned(
                  top: 60,
                  left: MediaQuery.of(context).size.width * 0.45 + 32,
                  child: Container(
                      height: 200,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Text(widget.cart.title,
                                style: TextStyle(fontSize: 20),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              widget.cart.price.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Divider(color: Colors.black),
                          Flexible(
                            flex: 2,
                            child: Text(
                              'cart_amount'.tr + ' ${widget.cart.quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
