import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_card_widget.dart';
import 'package:dalel_app/features/home/data/models/souvenirs_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_card_list_view.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_souvenirs_card.dart';
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
                  return CustomCardListView(
                    image:
                        context
                            .read<HomeCubit>()
                            .historicalSouvenirs[index]
                            .image,
                    name:
                        context
                            .read<HomeCubit>()
                            .historicalSouvenirs[index]
                            .name,
                  );
                },
              ),
            );
      },
    );
  }
}
