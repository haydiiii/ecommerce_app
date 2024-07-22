// login_cubit.dart
import 'dart:developer';

import 'package:ecommerce_app/core/services/dio_helper/cash_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view_model/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  login() {
    emit(LoginLoadingState());
    DioHelper.postData(url: EndPoints.login, data: {
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      Token.cacheBearerToken(token: value.data['data']['token']);
      CashHelper.cacheData('image', value.data['data']['image']);
      CashHelper.cacheData('email', value.data['data']['email']);
      CashHelper.cacheData('first_name', value.data['data']['first_name']);
      log(value.data['data']['token']);
      emit(LoginSuccessState());
    }).catchError((onError) {
      log(onError.toString());
      emit(LoginErrorsState(onError.toString()));
    });
  }
}
