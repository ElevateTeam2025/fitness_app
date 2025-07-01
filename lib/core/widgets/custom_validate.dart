import 'package:flutter/material.dart';
import 'package:fitness_app/generated/l10n.dart';

class AppValidate {
  static String? validateEmail(String? value, BuildContext context) {
    final tr = S.of(context);
    if (value == null || value.isEmpty) {
      return tr.enterEmail;
    }
    final regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!regex.hasMatch(value)) {
      return tr.invalidEmail;
    }
    return null;
  }

  static String? validateFirstName(String? value, BuildContext context) {
    final tr = S.of(context);
    if (value == null || value.isEmpty) {
      return tr.enterFirstName;
    }
    final regex = RegExp(r'^[A-Za-z\s]+$');
    if (!regex.hasMatch(value)) {
      return tr.invalidFirstName;
    }
    return null;
  }

  static String? validateLastName(String? value, BuildContext context) {
    final tr = S.of(context);
    if (value == null || value.isEmpty) {
      return tr.enterLastName;
    }
    final regex = RegExp(r'^[A-Za-z\s]+$');
    if (!regex.hasMatch(value)) {
      return tr.invalidLastName;
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    final tr = S.of(context);
    if (value == null || value.isEmpty) {
      return tr.enterPassword;
    }
    if (value.length < 8) {
      return tr.invalidPasswordLength;
    }
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (!regex.hasMatch(value)) {
      return tr.invalidPasswordPattern;
    }
    return null;
  }

  static String? validateUserName(String? value, BuildContext context) {
    final tr = S.of(context);
    final regex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null || value.isEmpty) {
      return tr.requiredField;
    } else if (!regex.hasMatch(value)) {
      return tr.invalidUserName;
    } else {
      return null;
    }
  }

  static String? validateMobile(String? value, BuildContext context) {
    final tr = S.of(context);
    final regExp = RegExp(r'^\+(\d{1,4})\d{7,10}$');
    if (value == null || value.isEmpty) {
      return tr.enterMobileNumber;
    } else if (!regExp.hasMatch(value)) {
      return tr.invalidMobileNumber;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    final tr = S.of(context);
    final phoneExp = RegExp(r'^\+?[0-9]{7,15}$');

    if (value == null || value.isEmpty) {
      return tr.phoneRequired;
    } else if (!phoneExp.hasMatch(value)) {
      return tr.invalidPhoneNumber;
    }
    return null;
  }
}
