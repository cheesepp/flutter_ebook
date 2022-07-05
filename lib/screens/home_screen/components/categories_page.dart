import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/title_text.dart';
import '../../../widgets/grid_dashboard.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText.headlineLarge(context, text: 'home_categories'.tr),
        const SizedBox(
          height: 30,
        ),
        Expanded(child: GridDashboard()),
      ],
    );
  }
}
