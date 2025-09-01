import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_form_signup.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 140)),
          SliverToBoxAdapter(child: WelcomWidget(text: AppStrings.welcome)),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomFormSigUp(),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAccount(
              textAccount: AppStrings.alreadyHaveAccount,
              signinOrsingnup: AppStrings.signIn,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 17)),
        ],
      ),
    );
  }
}
