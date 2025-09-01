import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/features/cart/presentation/cart_view.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/profile/presentation/views/profile_view.dart';
import 'package:dalel_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

final PersistentTabController _controller = PersistentTabController();

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      navBarStyle: NavBarStyle.style13,
      backgroundColor: AppColors.primaryColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        colorBehindNavBar: Colors.white,
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesChat),
      icon: SvgPicture.asset(Assets.assetsImagesChat2),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesSearch),
      icon: SvgPicture.asset(Assets.assetsImagesSearch2),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesMask),

      icon: SvgPicture.asset(Assets.assetsImagesShoppingCart),
    ),
    PersistentBottomNavBarItem(
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesPerson),
      icon: SvgPicture.asset(Assets.assetsImagesFrame2),
    ),
  ];
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create:
          (context) =>
              HomeCubit()
                ..getHistoricalPeriods()
                ..getHistoricalCharacters()
                ..getHistoricalSouvenirs(),
      child: HomeView(),
    ),
    SearchView(),
    CartView(),
    ProfileView(),
  ];
}
