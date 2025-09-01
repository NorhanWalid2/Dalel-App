import 'package:dalel_app/core/utls/app_strings.dart';

class HistoricalCharacterModel {
  final String name;
  final String image;
  final String description;
  final Map<String, dynamic> wars;

  HistoricalCharacterModel({
    required this.name,
    required this.image,
    required this.description,
    required this.wars,
  });
  factory HistoricalCharacterModel.fromJson(jsonData) {
    return HistoricalCharacterModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      wars: jsonData[FireBaseStrings.wars],
    );
  }
}
