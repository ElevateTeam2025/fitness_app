import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_icons.dart';
import 'package:fitness_app/core/utils/text_styles.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../domain/entity/section_json_model.dart';


class SectionContentWidget extends StatelessWidget {
  final Section section;
  final int index;
  final int totalSections;
  final PageController pageController;
  final String locale;

  const SectionContentWidget({
    Key? key,
    required this.section,
    required this.index,
    required this.totalSections,
    required this.pageController,
    required this.locale,
  }) : super(key: key);

  Color _parseColor(String hexColor) {
    var color = hexColor.toUpperCase().replaceAll('#', '');
    if (color.length == 6) color = 'FF$color';
    return Color(int.parse('0x$color'));
  }

  Widget buildText(String text, Map<String, dynamic> style) {
    final fontSize = (style['fontSize'] as num?)?.toDouble() ?? 16;
    final fontWeight = (style['fontWeight'] == 'bold') ? FontWeight.bold : FontWeight.normal;
    final color = _parseColor(style['color'] ?? '#000000');
    final alignStr = (style['textAlign']?[locale] ?? style['textAlign']?['en']) ?? 'left';
    final textAlign = TextAlign.values.firstWhere(
          (t) => t.toString().endsWith(alignStr),
      orElse: () => TextAlign.left,
    );

    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color, height: 1.4),
      textAlign: textAlign,
    );
  }

  IconData _getSocialIcon(String iconName) {
    switch (iconName) {
      case 'facebook':
        return FontAwesomeIcons.facebook;
      case 'twitter':
        return FontAwesomeIcons.twitter;
      case 'instagram':
        return FontAwesomeIcons.instagram;
      case 'whatsapp':
        return FontAwesomeIcons.whatsapp;
      case 'email':
        return Icons.email;
      default:
        return Icons.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rawStyle = section.style;
    final nestedTitle = rawStyle['title'] is Map<String, dynamic>;
    final nestedContent = rawStyle['content'] is Map<String, dynamic>;

    Map<String, dynamic> styleFor(bool isTitle) {
      if (nestedTitle && nestedContent) {
        return isTitle
            ? Map<String, dynamic>.from(rawStyle['title'])
            : Map<String, dynamic>.from(rawStyle['content']);
      }
      return Map<String, dynamic>.from(rawStyle);
    }

    String pick(Map<String, dynamic> map) => (map[locale] ?? map['en']) as String;

    final titleText = section.title != null ? pick(section.title!) : section.section;
    final contentRaw = section.content[locale] ?? section.content['en'];

    final contentWidgets = <Widget>[];

    if (contentRaw is String) {
      contentWidgets.add(buildText(contentRaw, styleFor(false)));
    } else if (contentRaw is List) {
      contentWidgets.addAll(contentRaw.map<Widget>((item) {
        if (item is String) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.HeightResponsive),
            child: buildText(item, styleFor(false)),
          );
        } else if (item is Map<String, dynamic>) {
          final label = item['label'] ?? '';
          final icon = item['icon'] ?? 'link';
          final link = item['link'] ?? '';

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.HeightResponsive),
            child: InkWell(
              onTap: () {
                debugPrint('Tapped on: $link');
                // we can use url_launcher here.................
              },
              child: Row(
                children: [
                  Icon(_getSocialIcon(icon), color: AppColors.whiteColor, size: 20.WidthResponsive),
                  SizedBox(width: 12.WidthResponsive),
                  Expanded(child: buildText(label, styleFor(false))),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }));
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.HeightResponsive, horizontal: 24.WidthResponsive),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            titleText,
            style: TextStyle(
              fontSize: (styleFor(true)['fontSize']?.toDouble() ?? 24),
              fontWeight: styleFor(true)['fontWeight'] == 'bold' ? FontWeight.bold : FontWeight.normal,
              color: _parseColor(styleFor(true)['color'] ?? '#000000'),
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3),
          SizedBox(height: 16.HeightResponsive),
          ...contentWidgets.map((w) => w.animate().fadeIn(duration: 600.ms).slideX(begin: 0.2)).toList(),
          SizedBox(height: 40.HeightResponsive),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (index > 0)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(AppIcons.back,color: AppColors.whiteColor,),
                    label: Text(S.of(context).previous, style: AppTextStyles.BalooThambi2_500_14.copyWith(color: AppColors.whiteColor)),
                  ),
                )
              else
                const Spacer(),
              SizedBox(width: 16.WidthResponsive),
              if (index < totalSections - 1)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Text(S.of(context).next, style: AppTextStyles.BalooThambi2_500_14.copyWith(color: AppColors.whiteColor)),
                    label: Icon(AppIcons.arrowRight,color: AppColors.whiteColor,),
                  ),
                )
              else
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(S.of(context).close, style: AppTextStyles.BalooThambi2_500_14.copyWith(color: AppColors.whiteColor)),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
