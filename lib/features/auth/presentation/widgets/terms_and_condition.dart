import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_chechbox.dart';
import 'package:flutter/widgets.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.ihaveAgreeTo,
                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.deepGrey,
                ),
              ),
              TextSpan(
                text: AppStrings.termAndCondition,
                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  color: AppColors.deepGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

