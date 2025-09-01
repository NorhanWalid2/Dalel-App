import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool termsAndConditionCheckBox = false;
  bool isPasswordVisible = false;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;

  Future<void> CreateUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress!,
            password: password!,
          );
      await addUser();
      await verfyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          SignUpFailureState(errMessage: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFailureState(
            errMessage: 'The account already exists for that email.',
          ),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          SignUpFailureState(
            errMessage: 'The email address is badly formatted.',
          ),
        );
      } else {
        emit(SignUpFailureState(errMessage: 'Check Email And Password'));
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  void updateTermsAndConditions({required newValue}) {
    termsAndConditionCheckBox = newValue;
    emit(termsAndConditionCheckBoxState());
  }

  void updatePasswordHideOrShow() {
    isPasswordVisible = !isPasswordVisible;
    emit(passwordHideOrShow());
  }

  Future<void> SignInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          SignInFailureState(
            errMessage: 'Wrong password provided for that user.',
          ),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          SignInFailureState(
            errMessage: 'The email address is badly formatted.',
          ),
        );
      } else {
        emit(SignInFailureState(errMessage: 'Check Email And Password'));
      }
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  Future<void> verfyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> resetPassword() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } on Exception catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
      // TODO
    }
  }

  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users
        .add({
          'email': emailAddress,
          'firstName': firstName,
          'lastName': lastName,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
