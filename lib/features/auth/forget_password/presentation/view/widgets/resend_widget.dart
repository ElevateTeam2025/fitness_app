import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ResendWidget extends StatelessWidget {
  const ResendWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'didnt recieve verification code?',
          style: AppTextStyles.BalooThambi2_400_16.copyWith(
            color: Colors.white,
          ),
        ),
        TextButton(
          style: ButtonStyle(
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
    
          onPressed: () {},
          child: Text(
            'ResendCode?',
            style: AppTextStyles.BalooThambi2_400_16,
          ),
        ),
      ],
    );
  }
}
