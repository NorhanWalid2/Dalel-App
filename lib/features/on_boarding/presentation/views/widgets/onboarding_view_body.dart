import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/onboarding_image.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({super.key,required this.controller,required this.onpagechanged});
  final controller;
final Function(int)? onpagechanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: PageView.builder(
        onPageChanged:onpagechanged ,
        controller: controller,
        itemCount: OnBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              OnBoardingImage(image: OnBoardingData[index].image),
              const SizedBox(height: 24),
              SmoothPageIndector(controller: controller),
              const SizedBox(height: 32),
              Text(
                OnBoardingData[index].title,

                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                OnBoardingData[index].subTitle,
                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
