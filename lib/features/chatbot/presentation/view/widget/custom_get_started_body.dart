import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import 'custom_chatbot_card.dart';

class CustomGetStartedBody extends StatelessWidget {
  const CustomGetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(ImageAssets.chatbotImage),
          SizedBox(height: 40.heightResponsive),
          CustomChatbotCard(),
          SizedBox(height: 40.heightResponsive),
        ],
      ),
    );
  }
}
