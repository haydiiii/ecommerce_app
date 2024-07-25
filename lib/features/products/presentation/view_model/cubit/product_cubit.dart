import 'dart:developer';

import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/products/presentation/model/products_model.dart';
import 'package:ecommerce_app/features/products/presentation/view_model/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];

  Future<void> getProducts() async {
    emit(ProductLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.products);
      if (response.statusCode == 200) {
        products = Pagination.fromJson(response.data).products;
        emit(ProductSuccessState());
      } else {
        emit(ProductErrorState(error: 'error is '));
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
      log("Exception: $e");
    }
  }
}

