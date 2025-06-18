import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/back_ground_image.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/forget_password_content_widget.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view/widgets/forget_password_top_left_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordCubit>();
    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autovalidateMode,
      child: Stack(
        children: [
          BackGroudImage(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 46.HeightResponsive),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('assets/images/app_logo.png')),
                  SizedBox(height: 96.HeightResponsive),

                  ForgetPasswordTopLeftTitle(),

                  SizedBox(height: 16.HeightResponsive),

                  ForgetPasswordContentWidget(
                    formKey: viewModel.formKey,
                    autovalidateMode: viewModel.autovalidateMode,
                    controller: viewModel.emailController,
                    onTap: _forgetPasswordFun,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _forgetPasswordFun() async {
    final viewModel = context.read<ForgetPasswordCubit>();
    if (viewModel.autovalidateMode == AutovalidateMode.always) {
      null;
    } else if (viewModel.formKey.currentState!.validate()) {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.disabled;
      });
      viewModel.request.email = viewModel.emailController.text;
      viewModel.doIntent(SendForgotPasswordIntent());
    } else {
      setState(() {
        viewModel.autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}



// Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/main_back_ground.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 46.HeightResponsive),
//           Center(child: Image.asset('assets/images/app_logo.png')),
//           SizedBox(height: 96.HeightResponsive),
//           Padding(
//             padding: EdgeInsets.only(left: 16.HeightResponsive),
//             child: Text(
//               'Enter Your Email',
//               style: AppTextStyles.BalooThambi2_400_18.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 16.HeightResponsive),
//             child: Text(
//               'Forget Password',
//               style: AppTextStyles.BalooThambi2_800_20.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           SizedBox(height: 16.HeightResponsive),
//           CustomContainerWidget(
//             body: [
//               SizedBox(
//                 height: 36.HeightResponsive,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     prefixIcon: Icon(
//                       Icons.mail_outline,
//                       color: Color(0xffD3D3D3),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24.HeightResponsive),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Send OTP',
//                   style: AppTextStyles.BalooThambi2_800_20.copyWith(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );


// Stack(
//       children: [
//         Positioned.fill(
//           child: Image.asset(
//             'assets/images/main_back_ground.png', // your image here
//             fit: BoxFit.cover,
//           ),
//         ),

//         // 🔹 Blur + Dark Overlay
//         Positioned.fill(
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 12.5, sigmaY: 12.5),
//             child: Container(
//               color: Color(0x801A1A1A), // semi-transparent black
//             ),
//           ),
//         ),
//       ],
//     );