import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/dio_helper/cash_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/profile/presentation/model/show_profile_model.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  ApiResponse? showProfileModel;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> showProfile() async {
    emit(ShowProfileLoadingState());
    try {
      String? token = CashHelper.getData('token');
      log('Token: $token');
      final response = await DioHelper.getData(
        url: EndPoints.showProfile,
        token: 'Bearer $token',
      );
      showProfileModel = ApiResponse.fromJson(response.data);
      log('Profile Data: ${response.data}');
      emit(ShowProfileSuccessState());
    } catch (error) {
      if (error is DioException) {
        log('DioError caught: ${error.response?.statusCode}');
        log('Response data: ${error.response?.data}');
        log('Headers: ${error.response?.headers}');
        emit(ShowProfileErrorState(
            errorMessage: error.message ?? 'Unknown error'));
      } else {
        log('Unexpected error: $error');
        emit(ShowProfileErrorState(errorMessage: error.toString()));
      }
    }
  }

  Future<void> updateProfile({required File image}) async {
    emit(UpdateProfileLoadingState());
    try {
      String? token = CashHelper.getData('token');
      log('Token: $token');
      final response = await DioHelper.postMultiPartData(
        url: EndPoints.updateProfile,
        data: FormData.fromMap({
          "_method": 'put',
          "first_name": firstNameController.text,
          "last_name": lastNameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "image": await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
        }),
        token: 'Bearer $token',
      );
      CashHelper.cacheData("image_url", response.data["data"]["image_url"]);
      log('Update Profile Response: ${response.data}');
      await showProfile();
      emit(UpdateProfileSuccessState());
    } catch (error) {
      if (error is DioException) {
        log('DioError caught: ${error.response?.statusCode}');
        log('Response data: ${error.response?.data}');
        log('Headers: ${error.response?.headers}');
        emit(UpdateProfileErrorState(
            errorMessage: error.message ?? 'Unknown error'));
      } else {
        log('Unexpected error: $error');
        emit(UpdateProfileErrorState(errorMessage: error.toString()));
      }
    }
  }
}
