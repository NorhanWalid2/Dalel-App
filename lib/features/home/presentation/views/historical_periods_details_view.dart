import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_about_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_description_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_home_app_bar_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_wars_widget.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/historical_period_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, required this.model});
  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 38),
        child: CustomScrollView(
          slivers: [
            //SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(child: CustomAppBarWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 17)),
            SliverToBoxAdapter(child: CustomAboutWidget(model: model)),
            SliverToBoxAdapter(child: SizedBox(height: 47)),
            SliverToBoxAdapter(child: CustomDescriptionWidget(model: model)),
            SliverToBoxAdapter(child: SizedBox(height: 22)),
            SliverToBoxAdapter(child: CustomHeaderWarsWidget(model: model)),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    right: 0,
                    child: SvgPicture.asset(Assets.assetsImagesNevirtiti),
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
                                  model.wars['image'].toString(),
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
                                model.wars['name'].toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // وصف
                              Text(
                                model.wars['description'].toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
