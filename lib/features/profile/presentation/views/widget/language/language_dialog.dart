import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/services/localization_service.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/common/get_responsive_height_and_width.dart';

void showLanguageDialog(BuildContext context) {
  final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
  final localeCode = localeProvider.locale.languageCode;
  final translations = S.of(context);

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'language_dialog',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => const SizedBox.shrink(),
    transitionBuilder: (ctx, anim1, anim2, child) {
      return ScaleTransition(
        scale: CurvedAnimation(parent: anim1, curve: Curves.easeOutBack),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Color(0xff2D2D2D).withOpacity(0.85),
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: responsiveHeight(20),
              horizontal: responsiveWidth(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  translations.language,
                  style: AppTextStyles.BalooThambi2_700_20.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                _buildLanguageTile(
                  title: translations.english,
                  flag: "🇺🇸",
                  code: 'en',
                  selected: localeCode == 'en',
                  onTap: () {
                    localeProvider.changeLocale(const Locale('en'));
                    Navigator.of(ctx).pop();
                  },
                ),
                const SizedBox(height: 12),
                _buildLanguageTile(
                  title: translations.arabic,
                  flag: "🇸🇦",
                  code: 'ar',
                  selected: localeCode == 'ar',
                  onTap: () {
                    localeProvider.changeLocale(const Locale('ar'));
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildLanguageTile({
  required String title,
  required String flag,
  required String code,
  required bool selected,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: responsiveHeight(12),
        horizontal: responsiveWidth(12),
      ),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryColor.withOpacity(0.1) : AppColors.greyTransparency,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? AppColors.primaryColor : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Text(flag, style: AppTextStyles.BalooThambi2_800_24),
          SizedBox(width: 12.widthResponsive),
          Text(
            title,
            style: AppTextStyles.balooThambi2_500_16.copyWith(
              color: selected ? AppColors.primaryColor : AppColors.greyColor,
            ),
          ),
          const Spacer(),
          if (selected)
            Icon(AppIcons.checkIcon, color: AppColors.primaryColor, size: 20),
        ],
      ),
    ),
  );
}


