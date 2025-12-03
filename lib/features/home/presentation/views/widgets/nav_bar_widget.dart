import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/features/bazar/presentation/bazar_view.dart';
import 'package:dalel_app/features/bazar/presentation/bazar_view_wrapper.dart';
import 'package:dalel_app/features/favourite/presentation/views/favourite_view.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/home_view.dart';
import 'package:dalel_app/features/profile/presentation/views/profile_view.dart';
import 'package:dalel_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  late AnimationController _controller;

  final List<Widget> _screens = [
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
    FavouriteView(),
    BazarPageWrapper(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      lowerBound: 0.85,
      upperBound: 1.0,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _navIcon(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 28 : 24,
            color: isSelected ? AppColors.deepBrown : Colors.white,
          ),
          if (isSelected)
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[selectedIndex], // <-- switch screens here
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScaleTransition(
        scale: _controller,
        child: GestureDetector(
          onTapDown: (_) => _controller.reverse(),
          onTapUp: (_) {
            _controller.forward();
            setState(() => selectedIndex = 2); // Cart
          },
          child: Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite,
              color: selectedIndex == 2 ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppColors.primaryColor,
        height: 70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navIcon(Icons.home_outlined, "Home", 0),
            _navIcon(Icons.search, "Search", 1),
            const SizedBox(width: 40),
            _navIcon(Icons.shopping_cart_outlined, "Bazar", 3),
            _navIcon(Icons.person_outline, "Profile", 4),
          ],
        ),
      ),
    );
  }
}
