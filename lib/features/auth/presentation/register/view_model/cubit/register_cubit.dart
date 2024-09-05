import 'dart:developer';

import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/features/auth/presentation/register/view_model/cubit/register_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/dio_helper/cash_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  register() async {
    emit(RegisterLoadingState());
    await DioHelper.postData(url: EndPoints.register, data: {
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "email": emailController.text,
      "password": passwordController.text
    }).then(
      (value) {
        if (value.data != null && value.data['data'] != null) {
          Token.cacheBearerToken(token: value.data["data"]["token"]);
          CashHelper.cacheData("image_url", value.data["data"]["image_url"]);
          CashHelper.cacheData("email", value.data["data"]["email"]);
          CashHelper.cacheData("fierst_name", value.data["data"]["first_name"]);
          log(value.data['data']['token']);
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorsState("Invalid response format"));
        }
      },
    ).catchError((onError) {
      log(onError.toString());
      emit(RegisterErrorsState(
        onError.toString(),
      ));
    });
  }
}
