import 'package:dalel_app/app/app.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/function/check_current_auth_state.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/bazar/data/souvenirs_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<SouvenirsModel> favourites = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  CheckCurrentAuthState();
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AuthCubit()),
      BlocProvider(
        create: (_) => HomeCubit()
          ..getHistoricalPeriods()
          ..getHistoricalCharacters()
          ..getHistoricalSouvenirs(),
      ),
    ],
    child: const MyApp(),
  ),);
}
