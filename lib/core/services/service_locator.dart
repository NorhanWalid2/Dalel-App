import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator(){
   getIt.registerSingleton<CacheHelper>(CacheHelper());
   getIt.registerSingleton<AuthCubit>(AuthCubit());
}
