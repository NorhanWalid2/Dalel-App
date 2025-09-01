import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

class EnterYourRegisteredWidget extends StatelessWidget {
  const EnterYourRegisteredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34.0, right: 34),
      child: Text(
        textAlign: TextAlign.center,
        AppStrings.enterRegisteredEmail,
        style: AppTextstyle.poppins500wstyle24.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.deepGrey,
        ),
      ),
    );
  }
}
