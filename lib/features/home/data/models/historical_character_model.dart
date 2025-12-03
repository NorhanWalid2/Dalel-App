import 'package:dalel_app/core/utls/app_strings.dart';

class War {
  final String title;
  final String image;

  War({required this.title, required this.image});

  factory War.fromJson(Map<String, dynamic> json) {
    return War(
      title: (json[FireBaseStrings.title] ?? '') as String,
      image: (json[FireBaseStrings.image] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      FireBaseStrings.title: title,
      FireBaseStrings.image: image,
    };
  }
}

class HistoricalCharacterModel {
  final String name;
  final String image;
  final String description;
  final List<War> wars;

  HistoricalCharacterModel({
    required this.name,
    required this.image,
    required this.description,
    required this.wars,
  });

  factory HistoricalCharacterModel.fromJson(Map<String, dynamic> jsonData) {
    final warsFromJson = (jsonData[FireBaseStrings.wars] as List<dynamic>?) ?? [];
    final warsList = warsFromJson.map((w) {
      if (w != null) return War.fromJson(w as Map<String, dynamic>);
      return War(title: '', image: '');
    }).toList();

    return HistoricalCharacterModel(
      name: (jsonData[FireBaseStrings.name] ?? '') as String,
      image: (jsonData[FireBaseStrings.image] ?? '') as String,
      description: (jsonData[FireBaseStrings.description] ?? '') as String,
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
