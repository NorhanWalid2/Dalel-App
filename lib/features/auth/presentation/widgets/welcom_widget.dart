
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomWidget extends StatelessWidget {
  const WelcomWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
       text,
        style: AppTextstyle.poppins500wstyle24.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}
