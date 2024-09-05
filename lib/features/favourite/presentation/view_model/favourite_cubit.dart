import 'package:ecommerce_app/core/services/dio_helper/dio_helper.dart';
import 'package:ecommerce_app/core/services/dio_helper/end_points.dart';
import 'package:ecommerce_app/core/services/dio_helper/token.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/features/favourite/data/favourite_model.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_state.dart';
import 'package:ecommerce_app/features/home/presentation/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);

  FavouriteModel? favouriteModel;
  List<NewProd> newProducts = [];

  Set<int> favoriteProductIds = {};

  void favouriteUser() {
    emit(FavouriteUserLoadingStates());
    DioHelper.getData(
            url: EndPoints.favouriteUser, token: Token.getBearerToken())
        .then((value) {
      favouriteModel = FavouriteModel.fromJson(value.data);
      favoriteProductIds.clear();
      favouriteModel?.data?.forEach((product) {
        favoriteProductIds.add(product.id!);
      });
      emit(FavouriteUserSuccessStates());
    }).catchError((onError) {
      emit(FavouriteUserErrorStates());
    });
  }

  void addFavourite({required int id, BuildContext? context}) {
    emit(AddFavouriteStates());
    DioHelper.getData(
            url: '${EndPoints.addFavourite}/$id', token: Token.getBearerToken())
        .then((value) {
      favoriteProductIds.add(id);
      showCustomDialog(context, message: 'Added to Favourite successfully');
      emit(AddFavouriteSuccessStates());
      emit(FavouriteUserSuccessStates()); // لإعادة بناء الواجهة
    }).catchError((onError) {
      emit(AddFavouriteErrorStates());
    });
  }

  void removeFavourite(int id) {
    emit(RemoveFavouriteLoadingStates());
    DioHelper.getData(
            url: '${EndPoints.removeFavourite}/$id',
            token: Token.getBearerToken())
        .then((value) {
      favouriteModel?.data?.removeWhere((element) => element.id == id);
      favoriteProductIds.remove(id);
      emit(RemoveFavouriteSuccessStates());
      favouriteUser();
     // emit(FavouriteUserSuccessStates());
    }).catchError((onError) {
      emit(RemoveFavouriteErrorStates());
    });
  }
}
