import 'package:dalel_app/core/utls/app_strings.dart';

class ProfileModel {
  final String firstName;
  final String lastName;
  final String image;
  final String email;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
  });
  factory ProfileModel.fromJson(jsonData) {
    return ProfileModel(
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
