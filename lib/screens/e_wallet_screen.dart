import 'package:flutter/material.dart';
import 'package:flutter_book/widgets/main_drawer.dart';
import 'package:get/get.dart';

import '../const/title_text.dart';

class EWalletScreen extends StatelessWidget {
  const EWalletScreen({Key? key}) : super(key: key);
  static const routeName = '/e_wallet_screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var _eWalletScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _eWalletScaffoldKey,
      drawer: const MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () =>
                          _eWalletScaffoldKey.currentState?.openDrawer(),
                      icon: const ImageIcon(
                        AssetImage("assets/images/drawer.png"),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  // padding: const EdgeInsets.only(left: 30),
                  child: TitleText.headlineLarge(context,
                      text: 'wallet_my_wallet'.tr)),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.25,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x80000000),
                        blurRadius: 30.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFCF8E8),
                        Color(0xFFF9F9F9),
                      ],
                    )),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      top: 25,
                      child: Image.network(
                          'https://assets.coingecko.com/coins/images/9395/large/Logo4-1.png?1566882337',
                          color: Colors.white.withOpacity(0.3),
                          colorBlendMode: BlendMode.modulate),
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: Text(
                        'wallet_current_balance'.tr,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 90,
                      child: Text(
                        '36 NBXCoin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 30,
                      child: Text('wallet_lastest_updated'.tr),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'wallet_history'.tr,
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(offset: Offset(3, 4), blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Text('22-04-2022'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(offset: Offset(3, 4), blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Text('22-05-2022'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 400,
                width: 350,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x80000000),
                      blurRadius: 30.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 10,
                      )),
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: Image.network(
                          'https://assets.coingecko.com/coins/images/9395/large/Logo4-1.png?1566882337'),
                      title: Text('hehe boi'),
                      subtitle: Text('22-04-2022'),
                      trailing: const Text(
                        '+13',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                    // return ListTile(
                    //   leading: Image.network(
                    //       'https://cdn-icons-png.flaticon.com/512/5363/5363211.png'),
                    //   title: Text('oh no boi'),
                    //   subtitle: Text('22-04-2022'),
                    //   trailing: const Text(
                    //     '-13',
                    //     style: TextStyle(
                    //         color: Colors.red,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
