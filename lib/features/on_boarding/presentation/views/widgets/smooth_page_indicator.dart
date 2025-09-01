import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndector extends StatelessWidget {
  const SmoothPageIndector({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.deepBrown,
        //dotColor: AppColors.offWhite,
        dotHeight: 10,
        dotWidth: 10,
      ),
    );
  }
}
