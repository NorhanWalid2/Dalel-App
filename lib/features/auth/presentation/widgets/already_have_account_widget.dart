import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/widgets.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
    required this.textAccount,
    required this.signinOrsingnup,
  });
  final String textAccount;
  final String signinOrsingnup;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAccount,
          style: AppTextstyle.poppins500wstyle24.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: AppColors.deepGrey,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            if (signinOrsingnup == AppStrings.signIn) {
              CustomNavigation(context, '/Login');
            } else {
              CustomNavigation(context, '/SignUp');
            }
          },
          child: Text(
            signinOrsingnup,
            style: AppTextstyle.poppins500wstyle24.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      ],
    );
  }
}
