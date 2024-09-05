import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  static ForgetCubit get(context) => BlocProvider.of(context);
  final password = TextEditingController();
  final emailForgetPassword = TextEditingController();
  final verifyCode = TextEditingController();

  forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    await DioHelper.postData(url: EndPoints.forgetPassword, data: {
      'email': emailForgetPassword.text,
    }).then((value) {
      emit(ForgetPasswordSucessState());
    }).catchError((onError) {
      // Log the error for debugging
      log('Error: $onError');
      emit(ForgetPasswordErrorState(error: 'something went wrong: $onError'));
    });
  }

  verifyCodeMethod() async {
    emit(VerifyCodeLoadingState());

    // Validate the verification code
    try {} catch (e) {
      emit(VerifyCodeErrorState(
          error: 'Invalid code format. Please enter a valid number.'));
      return;
    }

    // Check if the email field is populated
    if (emailForgetPassword.text.isEmpty) {
      emit(VerifyCodeErrorState(error: 'The email field is required.'));
      return;
    }

    await DioHelper.postData(url: EndPoints.verifyemail, data: {
      "email": emailForgetPassword.text,
      'otp': verifyCode.text, // Correct field name for the verification code
      //'email': emailForgetPassword.text, // Add the email field here
    }).then((value) {
      log('Server Response: ${value.data}');
      if (value.data['success'] as bool == true) {
        emit(VerifyCodeSucessState());
      } else {
        emit(VerifyCodeErrorState(error: 'The code is not correct'));
      }
    }).catchError((onError) {
      if (onError is DioException) {
        log('DioError: ${onError.response?.data}');
        emit(VerifyCodeErrorState(
            error: 'The code is not correct: ${onError.response?.data}'));
      } else {
        log('Error: $onError');
        emit(VerifyCodeErrorState(error: 'The code is not correct: $onError'));
      }
    });
  }

  resetPassword() {
    emit(ResetPasswordLoadingState());
    log('data: ${emailForgetPassword.text} ${verifyCode.text} ${password.text}');
    DioHelper.postData(url: EndPoints.resetPassword, data: {
      'email': emailForgetPassword.text,
      'otp': verifyCode.text,
      'password': password.text,
    }).then((value) {
      emit(ResetPasswordSucessState());
      log('Server Response: ${value.data}');
    }).catchError((onError) {
      emit(ResetPasswordErrorState(error: onError.toString()));
    });
  }
}
