class LoginStates {}

class LoginInitialState extends LoginStates {}  

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorsState extends LoginStates {
  final String error;
  LoginErrorsState(this.error);
}