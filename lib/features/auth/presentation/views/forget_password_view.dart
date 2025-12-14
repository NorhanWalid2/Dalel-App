import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/enter_your_registered_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/text_forget_password_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 70)),
          SliverToBoxAdapter(child: TextForgetPasswordWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 45)),
          SliverToBoxAdapter(
            child: Container(
              height: 235,
              width: 235,
              child: Image(image: AssetImage(Assets.assetsImagesFrame)),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(child: EnterYourRegisteredWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 45)),
          SliverToBoxAdapter(child: CustomForgotPasswordForm()),
          SliverToBoxAdapter(child: SizedBox(height: 17)),
        ],
      ),
    );
  }
}
