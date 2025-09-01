
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/cupertino.dart';

class Enet4DigetsWidget extends StatelessWidget {
  const Enet4DigetsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        AppStrings.enter4Digits,
        style: AppTextstyle.poppins500wstyle24.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.deepGrey,
        ),
      ),
    );
  }
}
