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

    final query =
        await FirebaseFirestore.instance
            .collection(FireBaseStrings.users)
            .where(FireBaseStrings.email, isEqualTo: user.email)
            .limit(1)
            .get();

    if (query.docs.isEmpty) return;

    final doc = query.docs.first; // 👈 مهم جدًا

    setState(() {
      profile = ProfileModel.fromJson(
        doc.data() as Map<String, dynamic>,
        doc.id, // 👈 documentId
      );
    });
  }

  Future<void> updateName(String firstName, String lastName) async {
    if (profile == null) return;

    await FirebaseFirestore.instance
        .collection(FireBaseStrings.users)
        .doc(profile!.id) // 👈 نفس document
        .update({'firstName': firstName, 'lastName': lastName});

    await loadProfile(); // 👈 refresh
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
