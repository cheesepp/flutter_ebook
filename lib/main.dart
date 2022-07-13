import 'package:flutter/material.dart';
import 'package:flutter_book/models/book.dart';
import 'package:flutter_book/screens/book_details_screen/book_details_screen.dart';
import 'package:flutter_book/screens/cart_screen.dart';
import 'package:flutter_book/screens/category_items.dart';
import 'package:flutter_book/screens/e_wallet_screen.dart';
import 'package:flutter_book/screens/home_screen/home_screen.dart';
import 'package:flutter_book/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_book/screens/settings/components/setting%20sections/change_resource_section.dart';
import 'package:flutter_book/screens/settings/setting_screen.dart';
import 'package:flutter_book/screens/test.dart';
import 'package:flutter_book/services/resource_service.dart';
import 'package:flutter_book/services/theme_service.dart';
import 'package:flutter_book/widgets/main_drawer.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_book/const/theme_data.dart' as theme;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'services/language_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ThemeService.init();
  await I18nService.init();
  await ResourceService().init();
  await Onboarding.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isOnboarding = true;
  @override
  void initState() {
    // TODO: implement initState
    isOnboarding = Onboarding().getOnboardingData() ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.ThemeMode.lightTheme,
      darkTheme: theme.ThemeMode.darkTheme,
      themeMode: ThemeService().theme,
      translations: I18nService(),
      locale: I18nService().locale,
      fallbackLocale: I18nService.fallbackLocale,
      home: isOnboarding ? const OnboardingScreen() : const OnboardingScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        EWalletScreen.routeName: (ctx) => const EWalletScreen(),
        SettingScreen.routeName: (ctx) => SettingScreen(),
        //       OrderScreen.routeName: (ctx) => OrderScreen(),
        //       UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
        //       EditProductScreen.routeName: (ctx) => EditProductScreen(),
      },
    );
  }
}
