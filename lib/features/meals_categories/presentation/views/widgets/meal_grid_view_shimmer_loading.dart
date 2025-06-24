import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MealGridViewShimmerLoading extends StatelessWidget {
  const MealGridViewShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(milliseconds: 500),
      color: Colors.grey[600]!,
      colorOpacity: 0.6,
      enabled: true,
      direction: ShimmerDirection.fromLTRB(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.RadiusResponsive),
        child: Container(
          color: Colors.grey[400],
          // child: Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.all(8.HeightResponsive),
          //     child: Container(
          //       height: 20
          //           .HeightResponsive, // Approximate height for the text
          //       width: 100
          //           .WidthResponsive, // Approximate width for the text
          //       color: Colors
          //           .grey[300], // Placeholder color for the text
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
