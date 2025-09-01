import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/utls/app_assets.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/features/profile/data/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  Future<ProfileModel?> getCurrentUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    print("Signed in user email: ${user?.email}");
    if (user == null) return null;

    QuerySnapshot query =
        await FirebaseFirestore.instance
            .collection(FireBaseStrings.users)
            .where(FireBaseStrings.email, isEqualTo: user.email)
            .get();

    if (query.docs.isEmpty) return null;

    var docData = query.docs[0].data() as Map<String, dynamic>;
    return ProfileModel.fromJson(docData);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileModel?>(
      future: getCurrentUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Text("User data not found");
        }

        ProfileModel profile = snapshot.data!;

        return ListTile(
          leading: CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(profile.image),
          ),
          title: Text(
            profile.firstName + ' ' + profile.lastName,
            style: AppTextstyle.heebo500wstyle18medium,
          ),
          subtitle: Text(
            profile.email,
            style: AppTextstyle.heebo400wstyle16Regular,
          ),
          trailing: Image.asset(Assets.assetsImagesEdit),
        );
      },
    );
  }
}
