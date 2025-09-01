import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/services/service_locator.dart';

void OnBoardingVisited(){
   getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited',value: true);
}