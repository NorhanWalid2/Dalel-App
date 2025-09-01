import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key,required this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextstyle.poppins500wstyle24.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.deepBrown,
      ),
    );
  }
}
