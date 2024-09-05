

 class RegisterState {}

 class RegisterInitial extends RegisterState {}
 class RegisterLoadingState extends RegisterState {}
  class   RegisterSuccessState extends RegisterState {}
  class   RegisterErrorsState extends RegisterState {
    final String error;
    RegisterErrorsState(this.error);
    
  }
