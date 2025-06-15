import 'package:flutter/material.dart';

import 'build_page_title.dart';

class SignupSelectGender extends StatelessWidget {
  const SignupSelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        BuildPageTitle(title: "TELL US ABOUT YOURSELF",subTitle: "We need to know your gender",)
      ],
    );
  }
}
