import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSection extends StatefulWidget {
  LanguageSection({Key? key, required this.lang, required this.onClick})
      : super(key: key);
  String lang;
  Function(String lang) onClick;
  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

String currentLanguage = "en".tr;

class _LanguageSectionState extends State<LanguageSection> {
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
              'setting_language'.tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ExpansionTile(title: Text(currentLanguage), children: [
            ListTile(
                title: Text("vi".tr),
                trailing: Radio(
                    value: 'vi',
                    groupValue: widget.lang,
                    onChanged: (value) {
                      widget.onClick('vi');
                      setState(() {
                        currentLanguage = "vi".tr;
                      });
                    }),
                onTap: () {
                  widget.onClick('vi');
                  setState(() {
                    currentLanguage = "vi".tr;
                  });
                }),
            ListTile(
                title: Text("en".tr),
                trailing: Radio(
                    value: 'en',
                    groupValue: widget.lang,
                    onChanged: (value) {
                      widget.onClick('en');
                      setState(() {
                        currentLanguage = "en".tr;
                      });
                    }),
                onTap: () {
                  widget.onClick('en');
                  setState(() {
                    currentLanguage = "en".tr;
                  });
                }),
            ListTile(
                title: Text("system_mode".tr),
                trailing: Radio(
                  value: 'system',
                  groupValue: widget.lang,
                  onChanged: (value) {
                    widget.onClick('system');
                    setState(() {
                      currentLanguage = "system_mode".tr;
                    });
                  },
                ),
                onTap: () {
                  widget.onClick('system');
                  setState(() {
                    currentLanguage = "system_mode".tr;
                  });
                }),
          ]
              // onExpansionChanged:,
              ),
        ],
      ),
    );
  }
}
