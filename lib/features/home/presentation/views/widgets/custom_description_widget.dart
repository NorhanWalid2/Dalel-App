import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class CustomDescriptionWidget extends StatelessWidget {
  const CustomDescriptionWidget({
    super.key,
    required this.model,
  });

  final HistoricalPeriodsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -24,
    
              child: SvgPicture.asset(Assets.assetsImagesPyramid),
            ),
            SizedBox(
              height: 220,
              width: 196,
              child: SingleChildScrollView(
                child: ReadMoreText(
                  model.description,
                  trimLines: 10,
                  colorClickableText: AppColors.grey3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: ' Read less',
                  style: AppTextstyle.poppins500wstyle24.copyWith(
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                  lessStyle: TextStyle(color: AppColors.grey3),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 50),
        Column(
          children: [
            SizedBox(height: 25),
            SizedBox(
              width: 131,
              height: 203,
              child: CachedNetworkImage(
                imageUrl: model.image,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
