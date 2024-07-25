
 class ProductState {}

 class ProductInitial extends ProductState {}
 class ProductLoadingState extends ProductState {}
 class ProductSuccessState extends ProductState {
   
 }
 class ProductErrorState extends ProductState {
   final String error;

  ProductErrorState({required this.error});
 }

