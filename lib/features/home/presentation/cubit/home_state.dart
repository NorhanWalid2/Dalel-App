part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodLoadingState extends HomeState {}

final class GetHistoricalPeriodSuccessState extends HomeState {}

final class GetHistoricalPeriodFailureState extends HomeState {
  final String errMessage;

  GetHistoricalPeriodFailureState({required this.errMessage});
}

final class GetHistoricalCharacterLoadingState extends HomeState {}

final class GetHistoricalCharacterSuccessState extends HomeState {}

final class GetHistoricalCharacterFailureState extends HomeState {
  final String errMessage;

  GetHistoricalCharacterFailureState({required this.errMessage});
}

final class GetHistoricalSouvenirsLoadingState extends HomeState {}

final class GetHistoricalSouvenirsSuccessState extends HomeState {}

final class GetHistoricalSouvenirsFailureState extends HomeState {
  final String errMessage;

  GetHistoricalSouvenirsFailureState({required this.errMessage});
}
