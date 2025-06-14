import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _executeNavigation();
    super.initState();
  }

  void _executeNavigation() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, PagesRoutes.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageAssets.bgImage,
          width: 243.WidthResponsive,
          height: 151.HeightResponsive,
        ),
      ),
    );
  }
}
