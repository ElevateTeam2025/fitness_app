import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class BuildGetStartedWidget extends StatefulWidget {
  const BuildGetStartedWidget({required this.onGetStarted, super.key});
  final VoidCallback onGetStarted;

  @override
  State<BuildGetStartedWidget> createState() => _BuildGetStartedWidgetState();
}

class _BuildGetStartedWidgetState extends State<BuildGetStartedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32.HeightResponsive,),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_animation.value),
                  child: Image.asset(
                    ImageAssets.chatbotImage,
                    height: 350.HeightResponsive,
                  ),
                );
              },
            ),
            SizedBox(height: 30.HeightResponsive),
            Container(
              height: 160.HeightResponsive,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.WidthResponsive),
              decoration: BoxDecoration(
                color: AppColors.containerBg.withOpacity(.4),
                borderRadius: BorderRadius.circular(50.RadiusResponsive),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "How Can I Assist You\nToday ?",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.BalooThambi2_600_24.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: widget.onGetStarted,
                    child: Text(
                      "Get Started",
                      style: AppTextStyles.BalooThambi2_800_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.HeightResponsive),
          ],
        ),
      ),
    );
  }
}
