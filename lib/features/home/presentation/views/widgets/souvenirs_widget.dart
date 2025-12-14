import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/widgets/custom_shimmer_card_widget.dart';
import 'package:dalel_app/features/bazar/presentation/views/bazar_view_wrapper.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/show_more.dart';
import 'package:dalel_app/features/home/presentation/views/widgets/souviner_list_view.dart';
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
                itemCount:
                    context.read<HomeCubit>().historicalSouvenirs.length + 1,
                itemBuilder: (context, index) {
                  if (index ==
                      context.read<HomeCubit>().historicalSouvenirs.length) {
                    return ShowMoreSouvenirCard();
                  } else {
                    return SouvenirsListView(
                      souvenirsModel:
                          context.read<HomeCubit>().historicalSouvenirs[index],
                    );
                  }
                },
              ),
            );
      },
    );
  }
}
