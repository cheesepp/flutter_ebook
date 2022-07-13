import 'package:flutter/material.dart';
import 'package:flutter_book/const/title_text.dart';
import 'package:flutter_book/screens/settings/components/setting%20sections/change_resource_section.dart';
import 'package:flutter_book/screens/settings/components/setting%20sections/language_section.dart';
import 'package:flutter_book/screens/settings/components/setting%20sections/theme_section.dart';
import 'package:flutter_book/services/resource_service.dart';
import 'package:flutter_book/widgets/main_drawer.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../services/language_service.dart';
import '../../services/theme_service.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);
  static const routeName = '/setting-screen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late String _mode;
  late String _language;
  late String _resourceName;

  @override
  void initState() {
    super.initState();
    _language = I18nService().locale == const Locale('vi', 'VN') ? 'vi' : 'en';
    _mode = ThemeService().theme == ThemeMode.dark ? 'dark' : 'light';
    _resourceName = ResourceService().getResourceName() ?? 'Firebase';
  }

  // Language
  _handleChangeLanguage(String newValue) {
    if (newValue == "system") {
      I18nService().syncToSystem();
    } else {
      I18nService().changeLocale(newValue);
    }
    setState(() {
      _language = newValue;
    });

    // Get.offAllNamed(Routes.splash);
  }

  // Theme
  void handleChangeMode(String newValue) {
    if (newValue == 'system') {
      ThemeService().switchToSystem();
    } else if (newValue != _mode) {
      if (newValue == 'dark' && ThemeService().theme == ThemeMode.light) {
        ThemeService().switchTheme();
      } else if (newValue == 'light' &&
          ThemeService().theme == ThemeMode.dark) {
        ThemeService().switchTheme();
      }
    }

    setState(() {
      _mode = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _settingScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _settingScaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () =>
                            _settingScaffoldKey.currentState?.openDrawer(),
                        icon: ImageIcon(
                          const AssetImage("assets/images/drawer.png"),
                          color: ThemeService().theme == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/setting.png'),
                        size: 50,
                      ),
                      TitleText.headlineLarge(context,
                          text: 'setting_setting'.tr, padding: 10),
                    ],
                  ),
                ),
                ThemeSection(
                  mode: _mode,
                  onClick: handleChangeMode,
                ),
                LanguageSection(
                    lang: _language, onClick: _handleChangeLanguage),
                ResourceSection(
                    onClick: (value) {}, resourceName: _resourceName)
              ],
            ),
          ),
        ));
  }
}
