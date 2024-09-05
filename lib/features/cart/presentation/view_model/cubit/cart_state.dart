
 class CartState {}

 class CartInitial extends CartState {}
 ///////CartUserState
 class CartUserLoadingState extends CartState {}

 class CartUserErrorState extends CartState {}

 class CartUserSuccessState extends CartState {}
 ///// add product to cart

 class AddProductToCartLoadingState extends CartState {}

 class AddProductToCartErrorState extends CartState {}

 class AddProductToCartSuccessState extends CartState {}
 ///////Update product to cart

 class UpdateProductToCartLoadingState extends CartState {}

 class UpdateProductToCartErrorState extends CartState {}

 class UpdateProductToCartSuccessState extends CartState {}

 ///// remove product from cart

 class RemoveProductFromCartLoadingState extends CartState {}

 class RemoveProductFromCartErrorState extends CartState {}

 class RemoveProductFromCartSuccessState extends CartState {}

 ///////////////////////////////////////////////////////
 class CartQuantityUpdatedState extends CartState {}
