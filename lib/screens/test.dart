import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50.0,
          width: 50.0,
          child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: null,
                  ),
                  Positioned(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 26,
                            top: 0,
                            child: Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.red)),
                        Positioned(
                            top: 2.0,
                            right: 10,
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
