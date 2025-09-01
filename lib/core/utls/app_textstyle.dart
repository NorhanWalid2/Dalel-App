import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:flutter/cupertino.dart';

abstract class AppTextstyle {
  static final pacifico400Style64 = TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.w400,
        color: AppColors.deepBrown,
        fontFamily: 'Pacifico',
      ),
      poppins500wstyle24 = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
      ),
      saira700wstyle32 = TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        fontFamily: 'Saira',
      ),
      heebo700wstyle24bold = TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.deepBrown,
        fontFamily: 'Heebo',
      ),
      heebo500wstyle18medium = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.deepBrown,
        fontFamily: 'Heebo',
      ),
      heebo400wstyle16Regular = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey2,
        fontFamily: 'Heebo',
      );
}
