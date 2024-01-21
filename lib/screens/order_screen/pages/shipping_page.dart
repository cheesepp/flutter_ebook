import 'package:flutter/material.dart';

import '../../../const/title_text.dart';

class ShippingPage extends StatelessWidget {
  ShippingPage({Key? key, required this.size}) : super(key: key);
  Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              width: size.width * 0.4,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.05,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Address',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Country',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05,),
        Row(
          children: [
            Checkbox(value: true, onChanged: (value){}),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text("Save for faster checkout next time",),
            )
          ],
        ),
        SizedBox(height: size.height * 0.05,),
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Continue To Payment',
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
    );
  }
}
