import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/features/cart/data/cart_model.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);
  CartModel? cartModel;
 CartModel? itemId;
  
  

///// get user cart

  userCart() {
    emit(CartUserLoadingState());
    DioHelper.getData(
      url: EndPoints.cartUser,
      token: Token.getBearerToken(),
    ).then((value) {
      cartModel = CartModel.fromJson(value.data);
      emit(CartUserSuccessState());
    }).catchError((onError) {
      emit(CartUserErrorState());
    });
  }
  ///// add product to cart

  addProductToCart(
      {required int id, required int quantity, required BuildContext context}) {
    emit(AddProductToCartLoadingState());
    DioHelper.postData(
      url: '${EndPoints.addToCart}/$id',
      token: Token.getBearerToken(),
      data: {'quantity': quantity},
    ).then((value) {
      itemId = CartModel.fromJson(value.data);
      showCustomDialog(context, message: 'Added to cart successfully');
      emit(AddProductToCartSuccessState());
    }).catchError((onError) {
      emit(AddProductToCartErrorState());
    });
  }

  // //// Update product to cart
  updateProductToCart({required int id, required int quantity}) {
    emit(UpdateProductToCartErrorState());
    DioHelper.postData(
      url: '${EndPoints.updateProdinCart}/$id',
      token: Token.getBearerToken(),
      data: {'quantity': quantity},
    ).then((value) {
      userCart();
      emit(UpdateProductToCartSuccessState());
    }).catchError((onError) {
      emit(UpdateProductToCartErrorState());
    });
  }
  ////// remove product from cart

  removeProductFromCart({required int id ,   required int index}) {
    emit(RemoveProductFromCartLoadingState());
    DioHelper.getData(
      url: '${EndPoints.removeProdCart}/$id',
      token: Token.getBearerToken(),
    ).then((value) {
      cartModel?.data?.removeAt(index);
      userCart();
      emit(RemoveProductFromCartSuccessState());
    }).catchError((onError) {
      emit(RemoveProductFromCartErrorState());
    });
  }
  //////////////////////////////////////////////////////////
  void decreaseQuantity(int id) {
    var item = cartModel?.data?.firstWhere((element) => element.id == id);
    if (item != null && int.parse(item.quantity) > 1) {
      item.quantity = (int.parse(item.quantity) - 1).toString();
      emit(CartQuantityUpdatedState());
    }
  }
}

