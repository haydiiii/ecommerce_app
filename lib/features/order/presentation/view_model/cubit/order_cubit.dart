import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/features/order/presentation/models/single_order.dart';
import 'package:ecommerce_app/features/order/presentation/models/user_orders_model.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  OrdersResponse? userOrdersModel;
  SingleOrder? singleOrderModel;

  orderNow() async {
    emit(OrderLoadingState());

    await DioHelper.postData(
            url: EndPoints.order,
            data: {
              'first_name': firstNameController.text,
              'last_name': lastNameController.text,
              'phone': phoneController.text,
              'address': addressController.text,
              'country': countryController.text
            },
            token: Token.getBearerToken())
        .then((value) async {
      emit(OrderSuccessState());
    }).catchError((error) {
      if (error is DioException && error.response?.statusCode == 401) {
        emit(OrderErrorState("Unauthorized. Please log in again."));
      } else {
        emit(OrderErrorState(error.toString()));
      }
    });
  }

  userOrders() async {
    emit(UserOrdersLoadedState());
    await DioHelper.getData(
            url: EndPoints.orderUser, token: Token.getBearerToken())
        .then((value) {
      userOrdersModel = OrdersResponse.fromJson(value.data);

      emit(UserOrdersSuccessState());
    }).catchError((error) {
      emit(UserOrdersErrorState(error.toString()));
    });
  }

  singleOrder(int id) async {
    emit(SingleOrderLoadingState());
    await DioHelper.getData(
            url: '${EndPoints.userShowOrder}/$id',
            token: Token.getBearerToken())
        .then((value) {
      singleOrderModel = SingleOrder.fromJson(value.data);

      emit(SingleOrderSuccessState());
    }).catchError((error) {
      emit(SingleOrderErrorState(error.toString()));
    });
  }
}
