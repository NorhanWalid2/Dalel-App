import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model.dart';
import 'package:flutter/material.dart';

class CustomCardListView extends StatelessWidget {
  const CustomCardListView({
    super.key, required this.historicalcharactersModel, required this.path,
   
  });
    final HistoricalCharacterModel historicalcharactersModel;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         CustomNavigation(context, path, extra:historicalcharactersModel );
      },
      child: Container(
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
              height: 96,
              child: CachedNetworkImage(
                imageUrl: historicalcharactersModel.image,
                fit: BoxFit.fill,
                placeholder:
                    (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 11),
            Text(
              historicalcharactersModel.name,
              style: AppTextstyle.poppins500wstyle24.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
