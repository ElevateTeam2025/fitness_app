import 'package:fitness_app/core/common/height_width_extention.dart';
import 'package:fitness_app/core/router/pages_routes.dart';
import 'package:fitness_app/features/profile/domain/entity/profile_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'custom_tile_widget.dart';
import 'json_view/json_content_bottom_sheet.dart';
import 'language/language_selector_tile.dart';
import 'logout/logout_Dialog.dart';
import 'logout/logout_widget.dart';

class ProfileOptionsSection extends StatelessWidget {
  const ProfileOptionsSection({super.key,required this.user});
 final UserData user;
  Widget _buildTileWithDivider(Widget tile) {
    return Column(
      children: [
        tile,
        const Divider(color: AppColors.dividerColor, thickness: 0.5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.WidthResponsive),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyTransparency,
          borderRadius: BorderRadius.circular(20.RadiusResponsive),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.WidthResponsive,
            vertical: 8.HeightResponsive,
          ),
          child: Column(
            children: [
              _buildTileWithDivider(
                CustomTileWidget(
                  icon: Image.asset(IconAssets.profile,width: 20.WidthResponsive,),
                  title: S.of(context).editProfile,
                  onTap: () {
                    Navigator.pushNamed(context, PagesRoutes.editProfile,arguments: user);
                  },
                ),
              ),
              _buildTileWithDivider(
                CustomTileWidget(
                  icon: Image.asset(IconAssets.changePasswordIcon),
                  title: S.of(context).changePassword,
                  onTap: () {
                    Navigator.pushNamed(context, PagesRoutes.changePassword);
                  },
                ),
              ),
              _buildTileWithDivider(const LanguageSelectorTile()),
              _buildTileWithDivider(
                CustomTileWidget(
                  icon: Image.asset(IconAssets.securityIcon),
                  title: S.of(context).security,
                  onTap: () {
                    JsonContentBottomSheet.show(
                      context,
                      assetPath:
                      JsonAssets.securityPolicyJsonAssets,
                      rootKey: 'security_policy',
                    );
                  },
                ),
              ),
              _buildTileWithDivider(
                CustomTileWidget(
                  icon: Image.asset(IconAssets.privacyIcon),
                  title: S.of(context).privacyPolicy,
                  onTap: () {
                    JsonContentBottomSheet.show(
                      context,
                      assetPath:
                      JsonAssets.privacyPolicyJsonAssets,
                      rootKey: 'privacy_policy',
                    );
                  },
                ),
              ),
              _buildTileWithDivider(
                CustomTileWidget(
                  icon: Image.asset(IconAssets.helpIcon),
                  title: S.of(context).help,
                  onTap: () {
                    JsonContentBottomSheet.show(
                      context,
                      assetPath:
                      JsonAssets.helpJsonAssets,
                      rootKey: 'help',
                    );
                  },
                ),
              ),
              CustomLogoutWidget(
                icon: Image.asset(IconAssets.logoutIcon),
                title: S.of(context).logout,
                onTap: () => showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
