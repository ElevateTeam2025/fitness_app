import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomTabBarShimmerAnimation extends StatelessWidget {
  const CustomTabBarShimmerAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53.heightResponsive,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Reasonable number
        padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.widthResponsive),
            child: Shimmer(
              duration: const Duration(seconds: 2),
              child: Container(
                width: 90.widthResponsive,
                height: 53.heightResponsive,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    50.radiusResponsive,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
