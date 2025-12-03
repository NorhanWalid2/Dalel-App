import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/core/function/navigation.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;

    // استخدم الدالة هنا
    _delayedNavigator(isOnBoardingVisited);
  }

  void _delayedNavigator(bool isOnBoardingVisited) {
    Future.delayed(Duration(seconds: 3), () {
      if (isOnBoardingVisited) {
        if (FirebaseAuth.instance.currentUser == null) {
          context.go('/Login');
        } else if (FirebaseAuth.instance.currentUser!.emailVerified) {
          context.go('/homeNavBar');
        } else {
          context.go('/Login');
        }
      } else {
        context.go('/Onboarding');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.offWhite, AppColors.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Image.asset('assets/images/logo.png', width: 150, height: 150),
                SizedBox(height: 20),
                Text(
                  AppStrings.dalel,
                  style: AppTextstyle.pacifico400Style64.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
