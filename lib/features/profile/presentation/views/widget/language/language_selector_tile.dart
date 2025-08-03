import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/services/localization_service.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/common/height_width_extention.dart';
import 'language_dialog.dart';

class LanguageSelectorTile extends StatelessWidget {
  const LanguageSelectorTile({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final isEnglish = localeProvider.locale.languageCode == 'en';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.heightResponsive, horizontal: 4.widthResponsive),
      child: Row(
        children: [
          Icon(AppIcons.language, color: AppColors.primaryColor, size: 18),
          SizedBox(width: 16.widthResponsive),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showLanguageDialog(context);
            },
            child: Row(
              children: [
                Text(
                  S.of(context).selectLanguage,
                  style: AppTextStyles.balooThambi2_400_13.copyWith(color: AppColors.whiteColor),
                ),
                SizedBox(width: 4.widthResponsive),
                Text(
                  '(${isEnglish ? S.of(context).english : S.of(context).arabic})',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),

      SizedBox(
        height: 24.heightResponsive,
        width: 40.widthResponsive,
        child: Transform.scale(
          scale: 0.75,
            child: Switch(
              value: isEnglish,
              activeColor: AppColors.whiteColor,
              activeTrackColor: AppColors.primaryColor,
              inactiveThumbColor: AppColors.primaryColor,
              inactiveTrackColor: AppColors.greyColor,
              onChanged: (value) {
                localeProvider.changeLocale(value ? const Locale('en') : const Locale('ar'));
              },
            ),
        )),

        ],
      ),
    );
  }
}
