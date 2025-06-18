import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../../../core/utils/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double size;
  final double strokeWidth;


  const CustomCircularProgressIndicator({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    this.size = 80.0,

    this.strokeWidth = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return Container(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Background circle
          CustomPaint(
            size: Size(size, size),
            painter: CircularProgressPainter(
              progress: 1.0,
              color: Colors.transparent.withOpacity(0.3),
              strokeWidth: strokeWidth,
            ),
          ),
          // Progress circle
          CustomPaint(
            size: Size(size, size),
            painter: CircularProgressPainter(
              progress: progress,
              color: AppColors.primaryColor,
              strokeWidth: strokeWidth,
            ),
          ),
          // Center text
          Center(
            child: Text(
              '$currentStep/$totalSteps',
              style:AppTextStyles.BalooThambi2_400_14.copyWith(color: AppColors.whiteColor)
            ),
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}