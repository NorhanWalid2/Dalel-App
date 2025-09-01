import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_card_widget.dart';
import 'package:dalel_app/features/home/data/models/historical_character.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is GetHistoricalCharacterFailureState) {
          showToastMessage(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalCharacterLoadingState
            ? CustomShimmerCardWidget()
            : SizedBox(
              height: 150,
              width: 83,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                scrollDirection: Axis.horizontal,
                itemCount:
                    context.read<HomeCubit>().historicalCharacters.length,
                itemBuilder: (context, index) {
                  return CustomCardListView(
                    image:
                        context
                            .read<HomeCubit>()
                            .historicalCharacters[index]
                            .image,
                    name:
                        context
                            .read<HomeCubit>()
                            .historicalCharacters[index]
                            .name,
                  );
                },
              ),
            );
      },
    );
  }
}
