import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomImageLoginWidget extends StatelessWidget {
  const CustomImageLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 375,
      height: 290,
      child: Container(
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppStrings.dalel,
              style: AppTextstyle.saira700wstyle32.copyWith(
                color: AppColors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(
                  //height: 102,
                  //width: 260,
                  image: AssetImage(Assets.assetsImagesVector),
                ),
                Image(
                  //height: 129,
                  //width: 177,
                  image: AssetImage(Assets.assetsImagesVector1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
  