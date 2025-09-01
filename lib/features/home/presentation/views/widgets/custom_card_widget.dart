import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.historicalPeriodsModel,
    required this.path,
  });
  final HistoricalPeriodsModel historicalPeriodsModel;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigation(context, path, extra: historicalPeriodsModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        height: 96,
        width: 175,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 16),
            SizedBox(
              height: 50,
              width: 62,
              child: Text(
                historicalPeriodsModel.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextstyle.poppins500wstyle24.copyWith(
                  fontSize: 15,
                  color: AppColors.deepBrown,
                ),
              ),
            ),
            Container(
              width: 47,
              height: 64,

              child: CachedNetworkImage(
                imageUrl: historicalPeriodsModel.image,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
