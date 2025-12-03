import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_card_widget.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    // Fetch characters if list is empty
    if (cubit.historicalCharacters.isEmpty) {
      cubit.getHistoricalCharacters();
    }

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalCharacterFailureState) {
          showToastMessage(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        // Show shimmer while loading
        if (state is GetHistoricalCharacterLoadingState &&
            cubit.historicalCharacters.isEmpty) {
          return CustomShimmerCardWidget();
        }

        // Show empty state if no characters
        if (cubit.historicalCharacters.isEmpty) {
          return const SizedBox(
            height: 150,
            child: Center(child: Text('No characters found')),
          );
        }

        // Show horizontal list
        return SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cubit.historicalCharacters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              final character = cubit.historicalCharacters[index];
              return CustomCardListView(
                path: '/homeHistoricalCharactersDetails',
                historicalcharactersModel: character,
              );
            },
          ),
        );
      },
    );
  }
}
