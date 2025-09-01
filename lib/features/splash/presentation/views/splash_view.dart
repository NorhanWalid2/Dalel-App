import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;
    if (isOnBoardingVisited) {
      FirebaseAuth.instance.currentUser == null
          ? DelayedNavigator(context, '/Login')
          : FirebaseAuth.instance.currentUser!.emailVerified == true
          ? DelayedNavigator(context, '/homeNavBar')
          : DelayedNavigator(context, '/Login');
    } else {
      DelayedNavigator(context, '/Onboarding');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Center(
        child: Text(AppStrings.dalel, style: AppTextstyle.pacifico400Style64),
      ),
    );
  }
}

void DelayedNavigator(context, path) {
  Future.delayed(Duration(seconds: 3), () {
    CustomReplacementNavigation(context, path);
  });
}
