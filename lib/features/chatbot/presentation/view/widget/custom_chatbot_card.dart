import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/chatbot/presentation/manager/chatbot_view_model.dart';
import 'package:fitness_app/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomChatbotCard extends StatelessWidget {
  const CustomChatbotCard({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return Container(
      height: 190.heightResponsive,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.widthResponsive,
        vertical: 30.heightResponsive,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBg.withOpacity(.4),
        borderRadius: BorderRadius.circular(50.radiusResponsive),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr.helpMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.balooThambi2_600_24.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8.heightResponsive),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ChatbotViewModel>(
                context,
              ).doIntent(GetStartedClickedIntent());
            },
            child: Text(
              tr.getStarted,
              style: AppTextStyles.BalooThambi2_800_14.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
