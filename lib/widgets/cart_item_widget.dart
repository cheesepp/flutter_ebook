import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
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
                      color: Colors.white,
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
                              image: NetworkImage(
                                  'https://images-na.ssl-images-amazon.com/images/I/71d2WrAUznL.jpg'),
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
                            child: Text('Computer Programming',
                                style: TextStyle(fontSize: 20),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              '200.000 VND',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Divider(color: Colors.black),
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Số lượng: 1',
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
