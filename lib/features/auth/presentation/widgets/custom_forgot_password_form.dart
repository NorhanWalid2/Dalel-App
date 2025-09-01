import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatefulWidget {
  CustomForgotPasswordForm({super.key});

  @override
  State<CustomForgotPasswordForm> createState() =>
      _CustomForgotPasswordFormState();
}

class _CustomForgotPasswordFormState extends State<CustomForgotPasswordForm> {
  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToastMessage(
            'Check Your Email for Reset Password',
            AppColors.primaryColor,
          );
          CustomNavigation(context, '/Login');
        } else if (state is ResetPasswordFailureState) {
          showToastMessage(
            'There is an error : ${state.errMessage}',
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomTextFormField(
                    labelText: AppStrings.emailAddress,

                    onchange: (emaill) {
                      authCubit.emailAddress = emaill;
                    },
                  ),
                ),
                SizedBox(height: 180),

                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(color: AppColors.primaryColor)
                    : CustomButton(
                      color: AppColors.primaryColor,
                      text: AppStrings.sendResetPasswordLink,
                      onpress: () {
                        if (key.currentState!.validate()) {
                          authCubit.resetPassword();
                        }
                      },
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
