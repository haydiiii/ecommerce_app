class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderSuccessState extends OrderState {}

class OrderErrorState extends OrderState {
  final String error;
  OrderErrorState(this.error);
}

class UserOrdersLoadedState extends OrderState {}

class UserOrdersErrorState extends OrderState {
  final String error;
  UserOrdersErrorState(this.error);
}

class UserOrdersSuccessState extends OrderState {}
 
 class SingleOrderSuccessState extends OrderState {}
 class SingleOrderLoadingState extends OrderState {}
 class SingleOrderErrorState extends OrderState {
  final String error;
  SingleOrderErrorState(this.error);
 }
 




