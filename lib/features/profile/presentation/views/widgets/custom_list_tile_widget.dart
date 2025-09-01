import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTileWidget extends StatelessWidget {
  CustomListTileWidget({
    super.key,
    required this.title,
    this.ontap,
    required this.image,
  });
  final String title;
  void Function()? ontap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(title),
            leading: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(image),
            ),
            trailing: GestureDetector(
              onTap: ontap,
              child: Image.asset(Assets.assetsImagesArrow),
            ),
          ),
          SizedBox(height: 16),
          Divider(color: AppColors.deepBrown, thickness: 0.5),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
