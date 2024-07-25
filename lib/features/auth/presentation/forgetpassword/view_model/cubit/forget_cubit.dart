import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());

  static ForgetCubit get(context) => BlocProvider.of(context);
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  final emailForgetPassword = TextEditingController();
  final verifyCode = TextEditingController();

  forgetPassword() {
    emit(ForgetPasswordLoadingState());
    DioHelper.postData(url: EndPoints.forgetPassword, data: {
      'email': emailForgetPassword.text,
    }).then((value) {
      emit(ForgetPasswordSucessState());
    }).catchError((onError) {
      // Log the error for debugging
      print('Error: $onError');
      emit(ForgetPasswordErrorState(error: 'something went wrong: $onError'));
    });
  }

  verifyCodeMethod() {
    emit(VerifyCodeLoadingState());
    DioHelper.postData(url: EndPoints.verifyemail, data: {
      'verify_code': verifyCode.text,
    }).then((value) {
      emit(VerifyCodeSucessState());
    }).catchError((onError) {
      emit(VerifyCodeErrorState(error: 'The code is not correct'));
    });
  }

  resetPassword() {
    emit(ResetPasswordLoadingState());
    DioHelper.postData(url: EndPoints.resetPassword, data: {
      'verify_code': verifyCode.text,
      'new_password': password.text,
      'new_password_confirmation': passwordConfirm.text,
    }).then((value) {
      emit(ResetPasswordSucessState());
    }).catchError((onError) {
      emit(ResetPasswordErrorState(error: 'something went wrong'));
    });
  }
}
