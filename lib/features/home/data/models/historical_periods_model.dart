import 'package:dalel_app/core/utls/app_strings.dart';

class HistoricalPeriodsModel {
  final String name;
  final String image;
  final String description;
  final Map<String, dynamic> wars;

  HistoricalPeriodsModel({
    required this.name,
    required this.image,
    required this.description,
    required this.wars,
  });
  factory HistoricalPeriodsModel.fromJson(jsonDta) {
    return HistoricalPeriodsModel(
      name: jsonDta[FireBaseStrings.name],
      image: jsonDta[FireBaseStrings.image],
      description: jsonDta[FireBaseStrings.description],
      wars: jsonDta[FireBaseStrings.wars],
    );
  }
}
