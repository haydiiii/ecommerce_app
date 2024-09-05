import 'dart:developer';

import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/features/home/presentation/models/home_model.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product/view_model/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<NewProd> products = [];

  Future<void> getProducts() async {
    emit(ProductLoadingState());
    try {
      final response = await DioHelper.getData(url: EndPoints.productsByCategory);
      log(response.data.toString());

      if (response.statusCode == 200) {
        final data = response.data['data']['data'];
        if (data is List) {
          products = data.map((json) => NewProd.fromJson(json)).toList();
          emit(ProductSuccessState());
        } else {
          emit(ProductErrorState("Error: Unexpected data format"));
          log("Error: Unexpected data format");
        }
      } else {
        emit(ProductErrorState("Error: ${response.statusCode} - ${response.statusMessage}"));
        log("Error: ${response.statusCode} - ${response.statusMessage}");
        log(response.data.toString());
      }
    } catch (e) {
      emit(ProductErrorState(e.toString()));
      log("Exception: $e");
    }
  }
}
