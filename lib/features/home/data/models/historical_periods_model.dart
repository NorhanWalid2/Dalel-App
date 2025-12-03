import 'package:dalel_app/core/utls/app_strings.dart';

class War {
  final String title;
  final String image;

  War({required this.title, required this.image});

  factory War.fromJson(Map<String, dynamic> json) {
    return War(
      title: json[FireBaseStrings.title],
      image: json[FireBaseStrings.image],
    );
  }

  Map<String, dynamic> toJson() {
    return {FireBaseStrings.title: title, FireBaseStrings.image: image};
  }
}

class HistoricalPeriodsModel {
  final String name;
  final String image;
  final String description;
  final List<War> wars;

  HistoricalPeriodsModel({
    required this.name,
    required this.image,
    required this.description,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromJson(Map<String, dynamic> jsonData) {
    var warsFromJson = jsonData[FireBaseStrings.wars] as List<dynamic>? ?? [];
    List<War> warsList =
        warsFromJson
            .map((w) => War.fromJson(w as Map<String, dynamic>))
            .toList();

    return HistoricalPeriodsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      description: jsonData[FireBaseStrings.description],
      wars: warsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      FireBaseStrings.name: name,
      FireBaseStrings.image: image,
      FireBaseStrings.description: description,
      FireBaseStrings.wars: wars.map((w) => w.toJson()).toList(),
    };
  }
}
