import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

class TextForgetPasswordWidget extends StatelessWidget {
  const TextForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        AppStrings.forgetPass,
        style: AppTextstyle.poppins500wstyle24.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
