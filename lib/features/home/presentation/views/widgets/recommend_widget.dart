
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

class recommendWidget extends StatelessWidget {
  const recommendWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Recommendations",
      style: AppTextstyle.poppins500wstyle24.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.deepBrown,
      ),
    );
  }
}
