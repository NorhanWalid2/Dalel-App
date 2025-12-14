import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_card_widget.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewWidget extends StatefulWidget {
  const CustomListViewWidget({super.key});

  @override
  State<CustomListViewWidget> createState() => _CustomListViewWidgetState();
}

class _CustomListViewWidgetState extends State<CustomListViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalCharacterFailureState) {
          showToastMessage(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        final characters = context.watch<HomeCubit>().historicalCharacters;

        if (state is GetHistoricalCharacterLoadingState) {
          return CustomShimmerCardWidget();
        }

        if (characters.isEmpty) {
          return const SizedBox(
            height: 150,
            child: Center(child: Text('No characters found')),
          );
        }

        return SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              return CustomCardListView(
                path: '/homeHistoricalCharactersDetails',
                historicalcharactersModel: characters[index],
              );
            },
          ),
        );
      },
    );
  }
}
