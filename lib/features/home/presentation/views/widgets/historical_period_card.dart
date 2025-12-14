import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_widget.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetHistoricalPeriodFailureState) {
          showToastMessage(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        final periods = context.watch<HomeCubit>().historicalPeriodModel;

        if (state is GetHistoricalPeriodLoadingState) {
          return CustomShimmerWidget();
        }

        if (periods.isEmpty) {
          return const SizedBox(
            height: 96,
            child: Center(child: Text("No periods found")),
          );
        }

        return SizedBox(
          height: 96,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: periods.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return CustomCardWidget(
                path: '/homeHistoricalPeriodDetails',
                historicalPeriodsModel: periods[index],
              );
            },
          ),
        );
      },
    );
  }
}
