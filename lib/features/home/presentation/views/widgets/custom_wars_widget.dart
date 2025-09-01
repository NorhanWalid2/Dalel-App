import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:flutter/material.dart';

class CustomHeaderWarsWidget extends StatelessWidget {
  const CustomHeaderWarsWidget({super.key, required this.model});

  final HistoricalPeriodsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${model.name} War",
          style: AppTextstyle.poppins500wstyle24.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.deepBrown,
          ),
        ),
      ],
    );
  }
}
