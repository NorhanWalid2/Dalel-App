import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:dalel_app/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({super.key});

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  ProfileModel? profile;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    var query =
        await FirebaseFirestore.instance
            .collection(FireBaseStrings.users)
            .where(FireBaseStrings.email, isEqualTo: user.email)
            .get();

    if (query.docs.isEmpty) return;

    var docData = query.docs[0].data() as Map<String, dynamic>;
    setState(() {
      profile = ProfileModel.fromJson(docData);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (profile == null)
      return const Center(child: CircularProgressIndicator());

    // أول حرف من الاسم
    String firstLetter =
        profile!.firstName.isNotEmpty
            ? profile!.firstName[0].toUpperCase()
            : "?";

    return ListTile(
      leading: CircleAvatar(
        radius: 45,
        backgroundColor: Colors.brown,
        child: Text(
          firstLetter,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        '${profile!.firstName} ${profile!.lastName}',
        style: AppTextstyle.heebo500wstyle18medium,
      ),
      subtitle: Text(
        profile!.email,
        style: AppTextstyle.heebo400wstyle16Regular,
      ),
    );
  }
}
