import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExerciseCardPlaceholder extends StatelessWidget {
  const ShimmerExerciseCardPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: AppColors.whiteColor,
      period: const Duration(milliseconds: 1500),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.WidthResponsive, vertical: 6.HeightResponsive),
        child: Row(
          children: [
            Container(
              width: 60.WidthResponsive,
              height: 70.HeightResponsive,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(12.RadiusResponsive),
              ),
            ),
            SizedBox(width:12.WidthResponsive),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16.HeightResponsive,
                    width: double.infinity,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height: 8.HeightResponsive),
                  Container(
                    height: 12.HeightResponsive,
                    width: 100.WidthResponsive,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height:8.HeightResponsive),
                  Container(
                    height: 12.HeightResponsive,
                    width: 80.WidthResponsive,
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
