import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_card_widget.dart';
import 'package:dalel_app/features/bazar/data/souvenirs_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SouvenirsWidget extends StatelessWidget {
  const SouvenirsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is GetHistoricalSouvenirsFailureState)
          showToastMessage(state.errMessage, Colors.red);
      },
      builder: (context, state) {
        return state is GetHistoricalSouvenirsLoadingState
            ? CustomShimmerCardWidget()
            : SizedBox(
              height: 150,
              width: 90,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: context.read<HomeCubit>().historicalSouvenirs.length,
                itemBuilder: (context, index) {
                  return SouvenirsListView(
                    souvenirsModel:
                        context.read<HomeCubit>().historicalSouvenirs[index],
                  );
                },
              ),
            );
      },
    );
  }
}

class SouvenirsListView extends StatelessWidget {
  const SouvenirsListView({super.key, required this.souvenirsModel});
  final SouvenirsModel souvenirsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigation(context, '/', extra: souvenirsModel);
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
              height: 90,
              child: CachedNetworkImage(
                imageUrl: souvenirsModel.image,
                fit: BoxFit.fill,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
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
      ),
    );
  }
}
