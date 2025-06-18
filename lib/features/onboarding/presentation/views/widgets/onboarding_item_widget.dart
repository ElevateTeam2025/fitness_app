import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/core/services/shared_preference_services.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/text_styles.dart';
import 'package:fitness_app/core/widgets/custom_container_widget.dart';
import 'package:fitness_app/features/onboarding/domain/onboarding_entity.dart';
import 'package:fitness_app/features/onboarding/presentation/cubits/change_onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.onboardingEntity,
    required this.pageController,
    required this.boardingItems,
    required this.index,
  });

  final OnboardingEntity onboardingEntity;
  final PageController pageController;
  final List<OnboardingEntity> boardingItems;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.HeightResponsive,
        right: 5.WidthResponsive,
        left: 5.WidthResponsive,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                SharedPreferenceServices.saveData('onBoarding', 'onBoarding');
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PagesRoutes.appSection,
                  (route) => false,
                );
              },
              child: Text(
                'Skip',
                style: AppTextStyles.BalooThambi2_400_14.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.HeightResponsive),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 230.HeightResponsive,
                  child: Center(
                    child: Image.asset(
                      onboardingEntity.image,
                      width: 375.WidthResponsive,
                      height: 516.HeightResponsive,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 460.HeightResponsive,
                  child: CustomContainerWidget(
                    body: [
                      Text(
                        onboardingEntity.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.BalooThambi2_800_24.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 12.HeightResponsive),
                      Text(
                        onboardingEntity.body,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.BalooThambi2_400_16.copyWith(
                          color: AppColors.whiteColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12.HeightResponsive),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: boardingItems.length,
                        effect: ExpandingDotsEffect(
                          dotColor: AppColors.greyColor,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 5,
                          activeDotColor: AppColors.primaryColor,
                          expansionFactor: 4,
                        ),
                      ),
                      SizedBox(height: 12.HeightResponsive),

                      SizedBox(
                        height: 40.HeightResponsive,
                        child: index == 0
                            ? ElevatedButton(
                                onPressed: () {
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 750),
                                    curve: Curves.easeInOut,
                                  );
                                  context
                                          .read<ChangeOnboardingViewModel>()
                                          .index =
                                      index + 1;
                                  context
                                      .read<ChangeOnboardingViewModel>()
                                      .doIntent(
                                        ClickedChangeOnboardingIntent(),
                                      );
                                },
                                child: Text(
                                  'Next',
                                  style:
                                      AppTextStyles
                                          .BalooThambi2_800_24.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: 14.FontSizeResponsive,
                                      ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      side: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.WidthResponsive,
                                      ),
                                      minimumSize: Size(
                                        63.WidthResponsive,
                                        40.HeightResponsive,
                                      ),
                                    ),
                                    onPressed: () {
                                      pageController.previousPage(
                                        duration: const Duration(
                                          milliseconds: 750,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                      context
                                              .read<ChangeOnboardingViewModel>()
                                              .index =
                                          index - 1;
                                      context
                                          .read<ChangeOnboardingViewModel>()
                                          .doIntent(
                                            ClickedChangeOnboardingIntent(),
                                          );
                                    },
                                    child: Text(
                                      'Back',
                                      style:
                                          AppTextStyles
                                              .BalooThambi2_800_24.copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.FontSizeResponsive,
                                          ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      minimumSize: Size(
                                        63.WidthResponsive,
                                        40.HeightResponsive,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (index == 2) {
                                        SharedPreferenceServices.saveData(
                                          'onBoarding',
                                          'onBoarding',
                                        );
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          PagesRoutes.appSection,
                                          (route) => false,
                                        );
                                      } else {
                                        pageController.nextPage(
                                          duration: const Duration(
                                            milliseconds: 750,
                                          ),
                                          curve: Curves.easeInOut,
                                        );
                                        context
                                                .read<
                                                  ChangeOnboardingViewModel
                                                >()
                                                .index =
                                            index + 1;
                                        context
                                            .read<ChangeOnboardingViewModel>()
                                            .doIntent(
                                              ClickedChangeOnboardingIntent(),
                                            );
                                      }
                                    },
                                    child: Text(
                                      'Next',
                                      style:
                                          AppTextStyles
                                              .BalooThambi2_800_24.copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 14.FontSizeResponsive,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
