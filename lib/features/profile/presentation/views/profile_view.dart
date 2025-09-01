import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/profile/presentation/views/widgets/custom_header_widget.dart';
import 'package:dalel_app/features/profile/presentation/views/widgets/custom_list_tile_widget.dart';
import 'package:dalel_app/features/profile/presentation/views/widgets/custom_title_widget.dart';
import 'package:dalel_app/features/profile/presentation/views/widgets/profile_info_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: CustomHeaderWidget(
                text: AppStrings.profile,
                textStyle: AppTextstyle.heebo700wstyle24bold,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: ProfileInfoWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
              child: CustomTitleWidget(text: AppStrings.account),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: CustomListTileWidget(
                title: AppStrings.editProfile,
                image: Assets.assetsImagesProfile,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomListTileWidget(
                title: AppStrings.notification,
                image: Assets.assetsImagesNotification,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(
              child: CustomTitleWidget(text: AppStrings.general),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: CustomListTileWidget(
                title: AppStrings.settings,
                image: Assets.assetsImagesSetting,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomListTileWidget(
                title: AppStrings.security,
                image: Assets.assetsImagesLock,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomListTileWidget(
                title: AppStrings.privacyPolicy,
                image: Assets.assetsImagesShield,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomListTileWidget(
                title: AppStrings.logOut,
                image: Assets.assetsImagesLogin,
                ontap: () {
                  FirebaseAuth.instance.signOut();
                  CustomNavigation(context, '/Login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
