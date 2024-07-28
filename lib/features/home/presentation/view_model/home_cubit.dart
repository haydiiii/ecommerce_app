import 'dart:developer';
import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/home/presentation/models/all_categories_model.dart';
import 'package:ecommerce_app/features/home/presentation/models/home_model.dart';
import 'package:ecommerce_app/features/home/presentation/models/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications_support/flutter_local_notifications.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  // Product? productByCategory;
  List<Product> productByCategory = [];
  List<Category> allCategories = [];
  List<NewProd> newProd = [];
  List<Carusels> sliders = [];
  List<TopProd> topProd = [];
  List<HotProd> hotProd = [];
  List<BestSellingProd> bestSellingProd = [];

  Future<void> getAllCategories() async {
    emit(HomeLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.allCategories);
      log(response.data.toString()); // Log the entire response
      if (response.statusCode == 200) {
        // Parse response data
        List<dynamic> jsonData = response.data['data'] as List<dynamic>;
        allCategories = parseCategories(jsonData);
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState());
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(HomeErrorState());
      log("Exception: $e");
    }
  }

  Future<void> getProductByCategory({required String url}) async {
    emit(ProductByCateryLoadingState());
    try {
      final response =
          await DioHelper.getData(url: '${EndPoints.products}/$url');
      log(response.data.toString());
      if (response.statusCode == 200) {
        final List<dynamic> productData = response.data['data']['data'];
        productByCategory =
            productData.map((json) => Product.fromJson(json)).toList();
        emit(ProductByCaterySuccessState());
      } else {
        emit(ProductByCateryErrorState(response.data.toString()));
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(ProductByCateryErrorState(e.toString()));
      log("Exception: $e");
    }
  }

  Future<void> getCarousel() async {
    emit(HomeLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      log(response.data.toString()); // Log the entire response
      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(response.data);
        sliders = homeModel.data?.carusels ?? [];
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState());
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(HomeErrorState());
      log("Exception: $e");
    }
  }

  Future<void> getNewProducts() async {
    emit(NewProductLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      log(response.data.toString());
      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(response.data);
        newProd = homeModel.data?.newProd ?? [];
        emit(NewProductSuccessState());
      } else {
        emit(NewProductErrorState());
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(NewProductErrorState());
      log("Exception: $e");
    }
  }

  Future<void> getTopProducts() async {
    emit(TopProductLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      log(response.data.toString());
      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(response.data);
        topProd = homeModel.data?.topProd ?? [];
        emit(TopProductSuccessState());
      } else {
        emit(TopProductErrorState());
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(TopProductErrorState());
      log("Exception: $e");
    }
  }

  Future<void> getHproducts() async {
    emit(HotProductLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      log(response.data.toString());
      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(response.data);
        hotProd = homeModel.data?.hotProd ?? [];
        emit(HotProductSuccessState());
      } else {
        emit(HotProductErrorState());
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(HotProductErrorState());
      log("Exception: $e");
    }
  }

  Future<void> getbestSeller() async {
    emit(BestSellerLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.home);
      log(response.data.toString());
      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(response.data);
        bestSellingProd = homeModel.data?.bestSellingProd ?? [];
        emit(BestSellerSuccessState());
      } else {
        emit(BestSellerErrorState());
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(BestSellerErrorState());
      log("Exception: $e");
    }
  }
}
