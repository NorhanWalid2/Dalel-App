
import 'package:dalel_app/core/utls/app_strings.dart';

class SouvenirsModel {
  final String name;
  final String image;
  final String price;

  SouvenirsModel({
    required this.name,
    required this.image,
    required this.price,
  });
  factory SouvenirsModel.fromJson(jsonData) {
    return SouvenirsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      price: jsonData[FireBaseStrings.price],
    );
  }
}
