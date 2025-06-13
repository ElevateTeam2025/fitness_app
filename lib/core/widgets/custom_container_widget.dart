import 'dart:ui';

import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({super.key, required this.body});

  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.RadiusResponsive),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 16.WidthResponsive,
              vertical: 24.HeightResponsive,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.001),
              borderRadius: BorderRadius.circular(30.RadiusResponsive),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: body),
          ),
        ),
      ),
    );
  }
}
