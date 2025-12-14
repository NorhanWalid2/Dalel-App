
import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model.dart';
import 'package:flutter/material.dart';

class aboutWidget extends StatelessWidget {
  const aboutWidget({
    super.key,
    required this.model,
  });

  final HistoricalCharacterModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${AppStrings.about} ${model.name}",
          style: AppTextstyle.poppins500wstyle24.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.deepBrown,
          ),
        ),
        SizedBox(width: 7),
        Image.asset(Assets.assetsImagesLifeKey),
      ],
    );
  }
}
