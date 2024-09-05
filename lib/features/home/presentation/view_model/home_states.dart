class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {}
// New Products
class NewProductLoadingState extends HomeStates {}

class NewProductSuccessState extends HomeStates {}

class NewProductErrorState extends HomeStates {}
//Top Products
class TopProductLoadingState extends HomeStates {}

class TopProductSuccessState extends HomeStates {}

class TopProductErrorState extends HomeStates {}
//Hot Products
class HotProductLoadingState extends HomeStates {}

class HotProductSuccessState extends HomeStates {}

class HotProductErrorState extends HomeStates {}
//best seller
class BestSellerLoadingState extends HomeStates {}

class BestSellerSuccessState extends HomeStates {}

class BestSellerErrorState extends HomeStates {}




class ProductByCateryLoadingState extends HomeStates {}

class ProductByCaterySuccessState extends HomeStates {}

class ProductByCateryErrorState extends HomeStates {
  final String message;
  ProductByCateryErrorState(this.message);
}

