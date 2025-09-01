import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_signin.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_image_login_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomImageLoginWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
            child: Align(child: WelcomWidget(text: AppStrings.welcomeBack)),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 48)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomFormSigIn(),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAccount(
              textAccount: AppStrings.dontHAveAccount,
              signinOrsingnup: AppStrings.signUp,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 17)),
        ],
      ),
    );
  }
}
