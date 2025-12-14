import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/features/home/data/models/historical_character_model.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/bazar/data/souvenirs_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historicalPeriodModel = [];
  List<HistoricalCharacterModel> historicalCharacters = [];
  List<SouvenirsModel> historicalSouvenirs = [];
  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodLoadingState());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historiaclPeriod)
          .get()
          .then(
            (value) => value.docs.forEach((element) {
              historicalPeriodModel.add(
                HistoricalPeriodsModel.fromJson(element.data()),
              );
            }),
          );
      emit(GetHistoricalPeriodSuccessState());
    } on Exception catch (e) {
      emit(GetHistoricalPeriodFailureState(errMessage: e.toString()));
      // TODO
    }
  }

  getHistoricalCharacters() async {
    try {
      print("***************************************************");
      emit(GetHistoricalCharacterLoadingState());
      historicalCharacters.clear();
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.historicalCharacter)
          .get()
          .then(
            (value) => value.docs.forEach((element) {
              historicalCharacters.add(
                HistoricalCharacterModel.fromJson(element.data()),
              );
            }),
          );
      emit(GetHistoricalCharacterSuccessState());
    } on Exception catch (e) {
      emit(GetHistoricalCharacterFailureState(errMessage: e.toString()));
    }
  }

  getHistoricalSouvenirs() async {
    try {
      emit(GetHistoricalSouvenirsLoadingState());
      await FirebaseFirestore.instance
          .collection(FireBaseStrings.souvenirs)
          .get()
          .then(
            (value) => value.docs.forEach((element) {
              historicalSouvenirs.add(SouvenirsModel.fromJson(element.data()));
            }),
          );
      emit(GetHistoricalSouvenirsSuccessState());
    } catch (e) {
      emit(GetHistoricalSouvenirsFailureState(errMessage: e.toString()));
    }
  }
}
