import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:dalel_app/features/auth/presentation/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormSigUp extends StatefulWidget {
  CustomFormSigUp({super.key});

  @override
  State<CustomFormSigUp> createState() => _CustomFormSigUpState();
}

class _CustomFormSigUpState extends State<CustomFormSigUp> {
  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToastMessage(
            'Successfully,Check your email to verfiy your account',
            AppColors.primaryColor,
          );
          CustomReplacementNavigation(context, '/Login');
        } else if (state is SignUpFailureState) {
          showToastMessage(state.errMessage, Colors.red);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: key,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,

                onchange: (firstname) {
                  authCubit.firstName = firstname;
                },
              ),
              SizedBox(height: 32),
              CustomTextFormField(
                labelText: AppStrings.lastName,

                onchange: (lastname) {
                  authCubit.lastName = lastname;
                },
              ),
              SizedBox(height: 25),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,

                onchange: (emaill) {
                  authCubit.emailAddress = emaill;
                },
              ),
              SizedBox(height: 25),
              CustomTextFormField(
                labelText: AppStrings.password,
                obscureText: !authCubit.isPasswordVisible,
                icon: GestureDetector(
                  onTap: () {
                    authCubit.updatePasswordHideOrShow();
                  },
                  child: Icon(
                    authCubit.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),

                onchange: (password) {
                  authCubit.password = password;
                },
              ),
              SizedBox(height: 16),
              TermsAndConditionWidget(),
              SizedBox(height: 88),
              state is SignUpLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                    color:
                        authCubit.termsAndConditionCheckBox == false
                            ? AppColors.lightGrey
                            : AppColors.primaryColor,
                    text: AppStrings.signUp,
                    onpress: () {
                      if (authCubit.termsAndConditionCheckBox == true) {
                        if (key.currentState!.validate()) {
                          authCubit.CreateUserWithEmailAndPassword();
                        }
                      }
                    },
                  ),
            ],
          ),
        );
      },
    );
  }
}
