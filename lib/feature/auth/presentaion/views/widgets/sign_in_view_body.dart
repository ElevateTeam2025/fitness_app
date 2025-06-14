// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// import '../../../../../core/common/get_responsive_height_and_width.dart';
// import '../../../../../core/router/pages_routes.dart';
// import '../../../../../core/utils/app_assets.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_icons.dart';
// import '../../../../../core/utils/text_styles.dart';
// import '../../../../../core/widgets/custom_container_widget.dart';
// import '../../../../../core/widgets/custom_validate.dart';
// import '../../../domain/entity/sign_in_request.dart';
// import '../../cubit/sign_in_cubit/sign_in_state.dart';
// import '../../cubit/sign_in_cubit/sign_in_view_model.dart';
//
// class SignInViewBody extends StatefulWidget {
//   final SignInViewModel signInViewModel;
//
//   const SignInViewBody({required this.signInViewModel, super.key});
//
//   @override
//   State<SignInViewBody> createState() => _SignInViewBodyState();
// }
//
// class _SignInViewBodyState extends State<SignInViewBody> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   AutovalidateMode validateMode = AutovalidateMode.disabled;
//   bool rememberMe = false;
//   bool isPasswordVisible = false;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignInViewModel, SignInState>(
//       bloc: widget.signInViewModel,
//       listener: (context, state) {
//         if (state is LoadingSignInState) {
//           EasyLoading.show();
//         } else if (state is SuccessSignInState) {
//           EasyLoading.dismiss();
//           Navigator.pushReplacementNamed(context, PagesRoutes.layoutView);
//         } else if (state is ErrorSignInState) {
//           EasyLoading.dismiss();
//           EasyLoading.showError(state.message);
//         }
//       },
//       builder: (context, state) {
//         return SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(
//               horizontal: responsiveWidth(16),
//               vertical: responsiveHeight(32),
//             ),
//             child: Form(
//               autovalidateMode: validateMode,
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(24),
//                     child: Center(
//                       child: Image.asset(
//                         ImageAssets.logo,
//                         height: responsiveHeight(60),
//                       ),
//                       // child: SvgPicture.asset(
//                       //   // SvgImages.logo,
//                       //   'assets/svg/logo.svg',
//                       //   fit: BoxFit.cover,
//                       //   width: 50,
//                       //   height: responsiveHeight(60),
//                       //   color: Colors.white,
//                       // ),
//                     ),
//                   ),
//                   SizedBox(height: responsiveHeight(20)),
//                   Text(
//                     'Hey There',
//                     style: AppTextStyles.BalooThambi2_400_16.copyWith(
//                       fontSize: 18,
//                       color: AppColors.whiteColor,
//                     ),
//                   ),
//                   Text(
//                     'WELCOME BACK',
//                     style: AppTextStyles.BalooThambi2_700_20.copyWith(
//                       fontWeight: FontWeight.w800,
//                       color: AppColors.whiteColor,
//                     ),
//                   ),
//                   SizedBox(height: responsiveHeight(24)),
//                   CustomContainerWidget(
//                     body:[
//                       Column(
//                         children: [
//                           Text(
//                             'Login',
//                             style: AppTextStyles.BalooThambi2_700_20.copyWith(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w800,
//                               color: AppColors.whiteColor,
//                             ),
//                           ),
//                           SizedBox(height: responsiveHeight(8),),
//                           TextFormField(
//
//                             autovalidateMode: validateMode,
//                             validator: AppValidate.validateEmail,
//                             onChanged: onChange,
//                             controller: _emailController,
//
//                             decoration: InputDecoration(
//                               hintText: 'email',
//                               prefixIcon: Icon(
//                                 AppIcons.email,
//                                 color: AppColors.whiteColor,
//                               ),
//                               // border: OutlineInputBorder(),
//
//                             ),
//                           ),
//                           SizedBox(height: responsiveHeight(16)),
//                           TextFormField(
//                             autovalidateMode: validateMode,
//                             obscureText: !isPasswordVisible,
//                             obscuringCharacter: '*',
//                             enableSuggestions: false,
//                             autocorrect: false,
//                             validator: AppValidate.validatePassword,
//                             onChanged: onChange,
//                             controller: _passwordController,
//                             decoration: InputDecoration(
//                               hintText: 'password',
//                               prefixIcon: Icon(
//                                 AppIcons.password,
//                                 color: AppColors.whiteColor,
//                               ),
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   isPasswordVisible
//                                       ? AppIcons.passwordVisibility
//                                       : AppIcons.passwordVisibilityOff,
//                                   color: AppColors.whiteColor,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     isPasswordVisible = !isPasswordVisible;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: responsiveHeight(8)),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(
//                                     context,
//                                     PagesRoutes.forgetPassword,
//                                   );
//                                 },
//                                 child: Text(
//                                   'forgetPassword',
//                                   style: AppTextStyles.BalooThambi2_400_12.copyWith(
//                                     color: AppColors.primaryColor,
//                                     decoration: TextDecoration.underline,
//                                     decorationColor: AppColors.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: responsiveHeight(8)),
//
//                           Center(
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                 validateMode == AutovalidateMode.disabled
//                                     ? AppColors.primaryColor
//                                     : AppColors.greyColor,
//                               ),
//                               onPressed: () {
//                                 if (validateMode == AutovalidateMode.always) {
//                                   return;
//                                 } else {
//                                   if (_formKey.currentState!.validate()) {
//                                     setState(() {
//                                       validateMode = AutovalidateMode.disabled;
//                                     });
//                                     var data = SignInRequest(
//                                       email: _emailController.text,
//                                       password: _passwordController.text,
//                                     );
//                                     widget.signInViewModel.doIntent(SignInClickedIntent(data));
//                                   } else {
//                                     setState(() {
//                                       validateMode = AutovalidateMode.always;
//                                     });
//                                   }
//                                 }
//                               },
//                               child: Text(
//                                 'Login',
//                                 style: AppTextStyles.BalooThambi2_600_14.copyWith(
//                                   color: AppColors.whiteColor,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: responsiveHeight(8)),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Don't have an account yet ? ",
//                                 style: AppTextStyles.BalooThambi2_400_14.copyWith(
//                                   color: AppColors.whiteColor,
//                                 ),
//                               ),
//
//                               InkWell(
//                                 onTap: () {},
//                                 child: Text(
//                                   " Register",
//                                   style: AppTextStyles.BalooThambi2_400_14.copyWith(
//                                     fontWeight: FontWeight.w800,
//                                     color: AppColors.primaryColor,
//                                     decoration: TextDecoration.underline,
//                                     decorationColor: AppColors.primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ]
//
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void onChange(value) {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         validateMode = AutovalidateMode.disabled;
//       });
//     } else {
//       setState(() {
//         validateMode = AutovalidateMode.always;
//       });
//     }
//   }
//
// }
import 'package:fitness_app/feature/auth/presentaion/views/widgets/sign_in_form.dart';
import 'package:fitness_app/feature/auth/presentaion/views/widgets/sign_in_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../core/router/pages_routes.dart';
import '../../../../../core/widgets/custom_container_widget.dart';
import '../../../domain/entity/sign_in_request.dart';
import '../../cubit/sign_in_cubit/sign_in_state.dart';
import '../../cubit/sign_in_cubit/sign_in_view_model.dart';


class SignInViewBody extends StatefulWidget {
  final SignInViewModel signInViewModel;

  const SignInViewBody({required this.signInViewModel, super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onChange(value) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewModel, SignInState>(
      bloc: widget.signInViewModel,
      listener: (context, state) {
        if (state is LoadingSignInState) {
          EasyLoading.show();
        } else if (state is SuccessSignInState) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('success');
          Navigator.pushReplacementNamed(context, PagesRoutes.layoutView);
        } else if (state is ErrorSignInState) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.message);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              // horizontal: responsiveWidth(16),
              vertical: responsiveHeight(32),
            ),
            child: Form(
              autovalidateMode: validateMode,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignInHeader(),
                  SizedBox(height: responsiveHeight(24)),
                  CustomContainerWidget(
                    body: [
                      SignInForm(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        validateMode: validateMode,
                        isPasswordVisible: isPasswordVisible,
                        onPasswordVisibilityToggle: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        onChange: onChange,
                        onSubmit: () {
                          if (validateMode == AutovalidateMode.always) return;

                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              validateMode = AutovalidateMode.disabled;
                            });
                            var data = SignInRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            widget.signInViewModel.doIntent(SignInClickedIntent(data));
                          } else {
                            setState(() {
                              validateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
