import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_widget.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is GetHistoricalPeriodFailureState) {
          showToastMessage(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        return state is GetHistoricalPeriodLoadingState
            ? CustomShimmerWidget()
            : SizedBox(
              height: 96,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount:
                    context.read<HomeCubit>().historicalPeriodModel.length,
                itemBuilder: (context, index) {
                  return CustomCardWidget(
                    path: '/homeHistoricalPeriodDetails',
                    historicalPeriodsModel:
                        context.read<HomeCubit>().historicalPeriodModel[index],
                  );
                },
              ),
            );
        
      },
    );
  }
}
