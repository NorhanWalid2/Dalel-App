import 'package:dalel_app/core/function/navigation.dart';
import 'package:dalel_app/core/function/toast_message.dart';
import 'package:dalel_app/core/utls/app_colors.dart';
import 'package:dalel_app/core/utls/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_button.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forget_password_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormSigIn extends StatefulWidget {
  CustomFormSigIn({super.key});

  @override
  State<CustomFormSigIn> createState() => _CustomFormSigInState();
}

class _CustomFormSigInState extends State<CustomFormSigIn> {
  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? CustomReplacementNavigation(context, '/homeNavBar')
              : showToastMessage(' please Verfy Your Account', Colors.red);
        } else if (state is SignInFailureState) {
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
              ForgetPasswordWidget(),
              SizedBox(height: 150),
              state is SignInLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                    color: AppColors.primaryColor,
                    text: AppStrings.signIn,
                    onpress: () {
                      if (key.currentState!.validate()) {
                        authCubit.SignInWithEmailAndPassword();
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
