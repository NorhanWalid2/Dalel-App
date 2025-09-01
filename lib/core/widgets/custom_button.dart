import 'package:dalel_app/core/utls/app_colors.dart';

import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onpress, required this.text, this.color});
  VoidCallback? onpress;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: AppTextstyle.poppins500wstyle24.copyWith(
          fontSize: 18,
          color: AppColors.white,
        ),
      ),
    );
  }
}
