import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.obscureText,
    this.icon,
    dthh,
    this.onchange,
    this.onfieldsubmit,
  });
  final Function(String)? onchange;
  final Function(String)? onfieldsubmit;
  final String labelText;
  final bool? obscureText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'this Field is required';
          } else {
            return null;
          }
        },
        onChanged: onchange,
        onFieldSubmitted: onfieldsubmit,
        obscureText: obscureText ?? false,
        obscuringCharacter: '•',

        style: AppTextstyle.poppins500wstyle24.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.deepBlack,
        ),
        decoration: InputDecoration(
          suffixIcon: icon,
          labelText: labelText,
          labelStyle: AppTextstyle.poppins500wstyle24.copyWith(
            fontSize: 15,
            color: AppColors.grey,
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.deepGrey),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.deepGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: AppColors.deepGrey),
          ),
        ),
      ),
    );
  }
}
