
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCardWidget extends StatelessWidget {
  const CustomShimmerCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        children: [
          Container(
            width: 83,
            height: 150,
            margin: EdgeInsets.only(right: 8),
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
          ),
          SizedBox(width: 16),
          Container(
            width: 83,
            height: 150,
            margin: EdgeInsets.only(right: 8),
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
          ),
          SizedBox(width: 16),
          Container(
            width: 83,
            height: 150,
            margin: EdgeInsets.only(right: 8),
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
          ),
        ],
      ),
    );
  }
}
