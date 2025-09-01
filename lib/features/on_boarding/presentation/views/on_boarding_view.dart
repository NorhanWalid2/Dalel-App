import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/utls/app_colors.dart';

import 'package:dalel_app/features/on_boarding/presentation/views/functions/getit_locator.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/Custom_nav_bar.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/get_buttons.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController(initialPage: 0);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              CustomNavBar(
                ontap: () {
                  OnBoardingVisited();
                  CustomReplacementNavigation(context, '/SignUp');
                },
              ),
              OnBoardingViewBody(
                onpagechanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: controller,
              ),
              const SizedBox(height: 88),
              GetButtons(currentIndex: currentIndex, controller: controller),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
