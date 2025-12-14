import 'package:dalel_app/core/utls/app_strings.dart';

class ProfileModel {
  final String id; //
  final String firstName;
  final String lastName;
  final String image;
  final String email;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
  });
  factory ProfileModel.fromJson(jsonData, String id) {
    return ProfileModel(
      id: id,
      firstName: jsonData[FireBaseStrings.firstName],
      lastName: jsonData[FireBaseStrings.lastName],
      image:
          (jsonData[FireBaseStrings.image] != null &&
                  jsonData[FireBaseStrings.image] != '')
              ? jsonData[FireBaseStrings.image]
              : 'https://example.com/placeholder.png',
      email: jsonData[FireBaseStrings.email],
    );
  }
}
