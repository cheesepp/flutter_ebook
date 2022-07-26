import 'package:flutter/material.dart';
import 'package:flutter_book/providers/cart_provider.dart';
import 'package:flutter_book/screens/cart_screen.dart';
import 'package:flutter_book/screens/home_screen/home_screen.dart';
import 'package:flutter_book/screens/settings/setting_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../screens/e_wallet_screen.dart';
import '../services/theme_service.dart';

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
          color: ThemeService().theme == ThemeMode.dark
              ? Colors.white
              : Colors.black,
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

  Widget buildListTileForCart(
      String title, Function tapHandler, BuildContext context) {
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
                    children: [
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
                              Provider.of<CartProvider>(context)
                                  .items
                                  .length
                                  .toString(),
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
        style: const TextStyle(
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Colors.black
            Color(0xFF3366FF),
            Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Drawer(
        // const Color(0xffF5EEDC),
        child: Column(
          children: <Widget>[
            headerWidget(context),
            Divider(
              thickness: 1,
              color: ThemeService().theme == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
            ),
            buildListTile('drawer_home'.tr, Icons.home, () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            }),
            buildListTileForCart('drawer_cart'.tr, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }, context),
            buildListTile('drawer_account'.tr, Icons.account_circle, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('drawer_settings'.tr, Icons.settings, () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingScreen.routeName);
            }),
            buildListTile('drawer_wallet'.tr, Icons.wallet_membership_rounded,
                () {
              Navigator.of(context).pushNamed(EWalletScreen.routeName);
            }),
            Divider(
              thickness: 1,
              color: ThemeService().theme == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
            ),
            buildListTile('drawer_about'.tr, Icons.info, () {
              Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
            }),
            buildListTile('drawer_log_out'.tr, Icons.logout, () {
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
              children: [
                Text('Trần Đình Nhật Trí',
                    style: TextStyle(
                      fontSize: 15,
                      color: ThemeService().theme == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text('person@email.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: ThemeService().theme == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
