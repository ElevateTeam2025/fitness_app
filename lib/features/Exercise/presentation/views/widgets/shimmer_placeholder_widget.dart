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
        padding: EdgeInsets.symmetric(horizontal: 8.widthResponsive, vertical: 6.heightResponsive),
        child: Row(
          children: [
            Container(
              width: 60.widthResponsive,
              height: 70.heightResponsive,
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(12.radiusResponsive),
              ),
            ),
            SizedBox(width:12.widthResponsive),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16.heightResponsive,
                    width: double.infinity,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height: 8.heightResponsive),
                  Container(
                    height: 12.heightResponsive,
                    width: 100.widthResponsive,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height:8.heightResponsive),
                  Container(
                    height: 12.heightResponsive,
                    width: 80.widthResponsive,
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
