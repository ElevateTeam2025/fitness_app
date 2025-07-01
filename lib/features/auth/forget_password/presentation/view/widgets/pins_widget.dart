import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/pin_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../generated/l10n.dart';

class PinsWidget extends StatelessWidget {
  const PinsWidget({
    super.key,
    required this.controller,
    required this.autovalidateMode,
  });
  final TextEditingController? controller;
  final AutovalidateMode autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return S.of(context).pleaseEnter6DigitCode;
        }
        return null;
      },
      cursorHeight: 10.HeightResponsive,
      length: 6,
      appContext: context,
      animationType: AnimationType.fade,
      pinTheme: pinTheme(),
      textStyle: TextStyle(color: Color(0xffFF4100)),
      keyboardType: TextInputType.number,
    );
  }
}
