import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/ancient_wars_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_home_app_bar_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/historical_character_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/historical_period_card.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/souvenirs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: CustomScrollView(
            slivers: [
              // SliverToBoxAdapter(child: SizedBox(height: 28)),
              SliverToBoxAdapter(child: CustomAppBarWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.historicalPeriods),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: CustomItemCard()),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.historicalCharacters),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(child: CustomListViewWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.ancientWar),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: AncientWarsWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.historicalSouvenirs),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: SouvenirsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
