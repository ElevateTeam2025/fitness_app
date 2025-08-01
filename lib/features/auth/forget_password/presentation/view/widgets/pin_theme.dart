import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

PinTheme pinTheme() {
  return PinTheme(
    borderWidth: 1.BorderResponsive,
    shape: PinCodeFieldShape.underline,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 25.HeightResponsive,
    fieldWidth: 40.WidthResponsive,
    activeFillColor: Color(0xffFF4100),
    activeColor: Color(0xffFF4100),
    inactiveColor: Colors.white,
    inactiveFillColor: Colors.white,
    selectedColor: Colors.white,
  );
}
