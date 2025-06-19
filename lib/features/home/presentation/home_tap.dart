import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:fitness_app/features/home/presentation/widget/home_catagory/home_category_list.dart';
import 'package:fitness_app/features/home/presentation/widget/home_tab_view_body.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_assets.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeTabViewBody();
  }
}
