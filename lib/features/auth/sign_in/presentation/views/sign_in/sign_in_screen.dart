import 'package:fitness_app/core/di/injectable_initializer.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

import '../../cubit/sign_in_cubit/sign_in_view_model.dart';
import '../widgets/sign_in_view_body.dart';
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  SignInViewModel signInViewModel = getIt.get<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.logInBackground),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SignInViewBody(signInViewModel: signInViewModel),
      ),
    );
  }
}
