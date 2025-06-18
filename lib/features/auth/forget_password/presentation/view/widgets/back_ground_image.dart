import 'package:flutter/material.dart';

class BackGroudImage extends StatelessWidget {
  const BackGroudImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/main_back_ground.png',
        fit: BoxFit.cover,
      ),
    );
  }
}