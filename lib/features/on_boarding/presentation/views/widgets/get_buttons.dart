import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/functions/getit_locator.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({
    super.key,
    required this.currentIndex,
    required this.controller,
  });
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == OnBoardingData.length - 1) {
      return Column(
        children: [
          CustomButton(
            text: AppStrings.createAcount,
            onpress: () {
              OnBoardingVisited();
              CustomReplacementNavigation(context, '/SignUp');
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            child: Text(
              'Login',
              style: AppTextstyle.poppins500wstyle24.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
               OnBoardingVisited();
              CustomReplacementNavigation(context, '/Login');
            },
          ),
        ],
      );
    } else {
      return CustomButton(
        text: AppStrings.next,
        onpress: () {
          controller.nextPage(
            duration: Duration(microseconds: 100),
            curve: Curves.ease,
          );
        },
      );
    }
  }
}
