import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fitness_app/core/common/get_responsive_height_and_width.dart';

class ShimmerExerciseCardPlaceholder extends StatelessWidget {
  const ShimmerExerciseCardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: AppColors.whiteColor,
      period: const Duration(milliseconds: 1500),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(8), vertical: responsiveHeight(6)),
        child: Row(
          children: [
            Container(
              width: responsiveWidth(60),
              height: responsiveHeight(70),
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: responsiveWidth(12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16.HeightResponsive,
                    width: double.infinity,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height: responsiveHeight(8)),
                  Container(
                    height: 12.HeightResponsive,
                    width: responsiveWidth(100),
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height: responsiveHeight(8)),
                  Container(
                    height: 12.HeightResponsive,
                    width: responsiveWidth(80),
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
