import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/theme_service.dart';

class ThemeSection extends StatefulWidget {
  ThemeSection({Key? key, required this.onClick, required this.mode})
      : super(key: key);
  String mode;
  Function(String mode) onClick;
  @override
  State<ThemeSection> createState() => _ThemeSectionState();
}

String currentTheme = 'dark_mode'.tr;

class _ThemeSectionState extends State<ThemeSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTheme = ThemeService().getTextTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              'setting_theme'.tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ExpansionTile(
            title: Text(currentTheme),
            children: [
              ListTile(
                  title: Text("dark_mode".tr),
                  trailing: Radio(
                      value: 'dark',
                      groupValue: widget.mode,
                      onChanged: (value) {
                        widget.onClick('dark');
                        setState(() {
                          currentTheme = "dark_mode".tr;
                          ThemeService().setTextTheme(currentTheme);
                        });
                      }),
                  onTap: () {
                    widget.onClick('dark');
                    setState(() {
                      currentTheme = 'dark_mode'.tr;
                      ThemeService().setTextTheme(currentTheme);
                    });
                  }),
              ListTile(
                  title: Text("light_mode".tr),
                  trailing: Radio(
                      value: 'light',
                      groupValue: widget.mode,
                      onChanged: (value) {
                        widget.onClick('light');
                        setState(() {
                          currentTheme = 'light_mode'.tr;
                          ThemeService().setTextTheme(currentTheme);
                        });
                      }),
                  onTap: () {
                    widget.onClick('light');
                    setState(() {
                      currentTheme = 'light_mode'.tr;
                      ThemeService().setTextTheme(currentTheme);
                    });
                  }),
              ListTile(
                  title: Text("system_mode".tr),
                  trailing: Radio(
                    value: 'system',
                    groupValue: widget.mode,
                    onChanged: (value) {
                      widget.onClick('system');
                      setState(() {
                        currentTheme = 'system_mode'.tr;
                        ThemeService().setTextTheme(currentTheme);
                      });
                    },
                  ),
                  onTap: () {
                    widget.onClick('system');
                    setState(() {
                      currentTheme = 'system_mode'.tr;
                      ThemeService().setTextTheme(currentTheme);
                    });
                  }),
            ],
            // onExpansionChanged:,
          ),
        ],
      ),
    );
  }
}
