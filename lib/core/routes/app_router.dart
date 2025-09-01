import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:dalel_app/features/auth/presentation/views/login_view.dart';
import 'package:dalel_app/features/auth/presentation/views/verfication_view.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/views/historical_periods_details_view.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/nav_bar_widget.dart';
import 'package:dalel_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel_app/features/auth/presentation/views/signup_view.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return SplashView();
      },
    ),
    GoRoute(
      path: '/Onboarding',
      builder: (context, state) {
        return OnBoardingView();
      },
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginView(),
        );
      },
    ),
    GoRoute(
      path: '/SignUp',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: SignUpView(),
        );
      },
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgetPasswordView(),
        );
      },
    ),
    GoRoute(
      path: '/verfication',
      builder: (context, state) {
        return VerficationView();
      },
    ),

    GoRoute(
      path: '/homeNavBar',
      builder: (context, state) {
        return NavBarWidget();
      },
    ),
    GoRoute(
      path: '/homeHistoricalPeriodDetails',
      builder: (context, state) {
      final model = state.extra as HistoricalPeriodsModel; 
    return HistoricalPeriodsDetailsView(model: model);
      },
    ),
    GoRoute(
      path: '/homeHistoricalCharactersDetails',
      builder: (context, state) {
        return NavBarWidget();
      },
    ),
  ],
);
