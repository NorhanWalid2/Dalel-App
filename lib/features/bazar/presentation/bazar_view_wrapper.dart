import 'package:dalel_app/features/bazar/presentation/bazar_view.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BazarPageWrapper extends StatelessWidget {
  const BazarPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: BazarView(),
    );
  }
}
