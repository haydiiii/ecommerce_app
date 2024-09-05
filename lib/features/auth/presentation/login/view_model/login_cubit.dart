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

  login() async {
    // print('enterrrrrrrrrrrrrrrrrrrrrrrrr');
    emit(LoginLoadingState());
    await DioHelper.postData(url: EndPoints.login, data: {
      "email": emailController.text
      //"admin@gmail.com"
      ,
      "password": passwordController.text

      // "112233"
    }).then((value) {
      // print('sucesssssssssssssrrrrrrrrrrrrrrrrrr');

      // Check if the value contains the data
      if (value.data != null && value.data['data'] != null) {
        // Store the token
        Token.cacheBearerToken(token: value.data["data"]["token"]);
        CashHelper.cacheData("image_url", value.data["data"]["image_url"]);
        CashHelper.cacheData("email", value.data["data"]["email"]);
        CashHelper.cacheData("first_name", value.data["data"]["first_name"]);
        CashHelper.cacheData("last_name", value.data["data"]["last_name"]);
        log(value.data['data']['token']);
        emit(LoginSuccessState());
      } else {
        //  print('enterrrrrrrrrrrrrrrrrrrrrrrrr');

        emit(LoginErrorsState("Invalid response format"));
      }
    }).catchError((onError) {
      //  print('faileeeeeeeeeeeeeeeedrrrrrr');

      log(onError.toString());
      emit(LoginErrorsState(onError.toString()));
    });
  }
}
