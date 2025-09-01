import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/widgets.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, this.ontap});
final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: ontap,
        child: Text(
          AppStrings.skip,
          style: AppTextstyle.poppins500wstyle24.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
