import 'package:flutter/material.dart';

import '../../const/title_text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            TitleText.headlineLarge(context, text: "Order"),
            Column(
              children: [
                SizedBox(height: size.height*0.05,),
                SizedBox(
                    height: size.height * 0.15,
                    width: size.width * 0.2,
                    child: Image.asset('assets/images/confirm.png')),

                Text('Thanks for your purchase!', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                SizedBox(height: size.height * 0.45,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue To Shopping!',
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 30,
                      fixedSize: Size(size.width*0.7, size.height*0.07),
                      primary: const Color(0xff1C1A1A), // background
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // foreground
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
