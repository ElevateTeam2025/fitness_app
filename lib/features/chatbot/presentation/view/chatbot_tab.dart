import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/chatbot/presentation/view/widget/custom_chatbot_row.dart';
import 'package:flutter/material.dart';

class ChatbotTab extends StatelessWidget {
  const ChatbotTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
      child: Column(
        children: [
          SizedBox(height: 24.HeightResponsive),
          CustomChatbotRow(),
        ],
      ),
    );
  }
}
