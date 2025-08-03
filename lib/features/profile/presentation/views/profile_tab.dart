import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/features/profile/presentation/views/widget/profile_option_section_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../../../core/router/pages_routes.dart';
import '../../../../generated/l10n.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';
import 'widget/profile_app_bar_widget.dart';
import 'widget/user_information_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileViewModel>()..doIntent(ProfileClickedIntent()),
      child: BlocConsumer<ProfileViewModel, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              PagesRoutes.signIn,
                  (route) => false,
            );
          } else if (state is ErrorProfileState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (state is SuccessProfileState) {
            final user = state.user;

            if (user == null) {
              return Center(child: Text(S.of(context).noUserData));
            }

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.exerciseBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100.heightResponsive),
                child: Column(
                  children: [
                    const ProfileAppBarWidget(),
                    SizedBox(height: 24.heightResponsive),
                    UserInformationWidget(userData: user),
                    SizedBox(height: 24.heightResponsive),
                    //
                     ProfileOptionsSection(user: user,),
                  ],
                ),
              ),
            );
          } else if (state is ErrorProfileState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
