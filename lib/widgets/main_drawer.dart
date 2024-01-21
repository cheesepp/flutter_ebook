import 'package:flutter/material.dart';
import 'package:flutter_book/screens/cart_screen.dart';
import 'package:flutter_book/screens/home_screen/home_screen.dart';

import '../screens/e_wallet_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Icon(
          icon,
          size: 26,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          // fontFamily: 'RobotoCondensed',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler as Function(),
    );
  }

  Widget buildListTileFoCart(String title, Function tapHandler) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        child: GestureDetector(
            onTap: () {},
            child: Stack(
              children: <Widget>[
                const IconButton(
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
      title: Text(
        title,
        style: TextStyle(
          // fontFamily: 'RobotoCondensed',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler as Function(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Colors.black
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Drawer(
        // const Color(0xffF5EEDC),
        child: Column(
          children: <Widget>[
            headerWidget(context),
            // Container(
            //   height: 120,
            //   width: double.infinity,
            //   padding: EdgeInsets.all(20),
            //   alignment: Alignment.centerLeft,
            //   color: Theme.of(context).accentColor,
            //   child: Text(
            //     'Cooking Up!',
            //     style: TextStyle(
            //         fontWeight: FontWeight.w900,
            //         fontSize: 30,
            //         color: Theme.of(context).primaryColor),
            //   ),
            // ),
            const Divider(
              thickness: 4,
            ),
            buildListTile('Trang chủ', Icons.home, () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            }),
            buildListTileFoCart('Giỏ hàng', () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('Tài khoản', Icons.account_circle, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('Cài đặt', Icons.settings, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('Ví điện tử', Icons.wallet_membership_rounded, () {
              Navigator.of(context).pushNamed(EWalletScreen.routeName);
            }),
            const Divider(
              thickness: 4,
            ),
            buildListTile('About', Icons.info, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('Logout', Icons.logout, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    const url =
        'https://i.pinimg.com/originals/86/08/70/860870066df05a7a29bcb5bb9ea2e9a7.jpg';
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15, color: Colors.black, spreadRadius: 2)
                ],
              ),
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(url),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Trần Đình Nhật Trí',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                SizedBox(
                  height: 5,
                ),
                Text('person@email.com',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
