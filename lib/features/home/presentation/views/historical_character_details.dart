import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/about_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_description_charcter.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_home_app_bar_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/historical_character_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/recommend_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/war_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoricalCharactersDetailsView extends StatelessWidget {
  const HistoricalCharactersDetailsView({super.key, required this.model});
  final HistoricalCharacterModel model;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(child: CustomAppBarWidget()),
              SliverToBoxAdapter(child: SizedBox(height: 17)),
              SliverToBoxAdapter(
                child: aboutWidget(model: model),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 47)),
              SliverToBoxAdapter(
                child: CustomDescriptionCharcter(model: model),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 22)),
              SliverToBoxAdapter(
                child: WarNameWidget(model: model),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      right: 0,
                      child: SvgPicture.asset(Assets.assetsImagesEagle),
                    ),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.wars.length,
                        separatorBuilder:
                            (context, _) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // صورة
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    model.wars[index].image.toString(),
                                    height: 90,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (_, __, ___) => const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // اسم الحرب
                                Text(
                                  model.wars[index].title.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: recommendWidget(),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: CustomListViewWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
