import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(child: Image(image: AssetImage(Assets.assetsImagesLayer))),
        Text(
          AppStrings.dalel,
          style: AppTextstyle.pacifico400Style64.copyWith(fontSize: 22),
        ),
      ],
    );
  }
}
