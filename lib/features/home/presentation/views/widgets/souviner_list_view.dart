import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/bazar/data/souvenirs_model.dart';
import 'package:flutter/material.dart';

class SouvenirsListView extends StatelessWidget {
  const SouvenirsListView({super.key, required this.souvenirsModel});
  final SouvenirsModel souvenirsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 10,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 90,
            child: CachedNetworkImage(
              imageUrl: souvenirsModel.image,
              fit: BoxFit.fill,
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Text(
              souvenirsModel.name,
              style: AppTextstyle.poppins500wstyle24.copyWith(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
