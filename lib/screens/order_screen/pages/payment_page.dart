import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key, required this.size}) : super(key: key);
  Size size;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Container(
            width: widget.size.width*0.8,
            height: widget.size.height*0.075,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Radio(
                    value: "hehe",
                    groupValue: "hoho",
                    onChanged: (value) {
                      setState() {
                        value = "hoho";
                      }
                    }),
                Text("Cash On Delivery"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            width: widget.size.width*0.8,
            height: widget.size.height*0.075,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Radio(
                    value: "hihi",
                    groupValue: "hoho",
                    onChanged: (value) {}),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/mastercard.png')),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect (
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/visa.png'),
                    )

                ),

              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: widget.size.width * 0.4,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              width: widget.size.width * 0.4,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'CVV/CVC',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: widget.size.height*0.2,),
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
              fixedSize: Size(widget.size.width*0.7, widget.size.height*0.07),
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
