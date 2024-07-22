import 'dart:developer';
import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/home/presentation/models/carousal_model.dart';
import 'package:ecommerce_app/features/home/presentation/models/category_model.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Category>? allCategories = [];
  List<Carousel>? sliders = [];

  Future<void> getAllCategories() async {
    emit(HomeLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      if (response.statusCode == 200) {
        allCategories = (response.data['data']['categories'] as List)
            .map((category) => Category.fromJson(category))
            .toList();
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState());
        log(response.data.toString());
      }
    } catch (e) {
      emit(HomeErrorState());
      log(e.toString());
    }
  }

  Future<void> getCarousel() async {
    emit(HomeLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      if (response.statusCode == 200) {
        sliders = (response.data['data']['carousels'] as List)
            .map((carousel) => Carousel.fromJson(carousel))
            .toList();
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState());
        log(response.data.toString());
      }
    } catch (e) {
      emit(HomeErrorState());
      log(e.toString());
    }
  }
}
