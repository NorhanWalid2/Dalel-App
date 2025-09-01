import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/widgets/enter4_digets_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/pint_put_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/resend_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerficationView extends StatelessWidget {
  const VerficationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 100)),
          SliverToBoxAdapter(
            child: Align(
              child: Text(
                AppStrings.verfiyAccount,
                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: Enet4DigetsWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(child: PinPutt()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          SliverToBoxAdapter(
            child: Align(
              child: Text(
                AppStrings.haventReceivedVerficationCode,
                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.deepGrey,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: ResendCodeWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 380)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: AppStrings.verficationNow,
                onpress: () {},
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
