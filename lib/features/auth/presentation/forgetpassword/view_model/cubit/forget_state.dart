class ForgetState {}

class ForgetInitial extends ForgetState {}

class ForgetPasswordLoadingState extends ForgetState {}

class ForgetPasswordErrorState extends ForgetState {
  final String error;

  ForgetPasswordErrorState({required this.error});
}
class ForgetPasswordSucessState extends ForgetState {}
///////******************************************************************* */
///
///
class VerifyCodeLoadingState extends ForgetState {}

class VerifyCodeErrorState extends ForgetState {
  final String error;

  VerifyCodeErrorState({required this.error});
}
class VerifyCodeSucessState extends ForgetState {}
///////************************************************///////// */
///
///
class ResetPasswordLoadingState extends ForgetState {}

class ResetPasswordErrorState extends ForgetState {
  final String error;

  ResetPasswordErrorState({required this.error});
}
class ResetPasswordSucessState extends ForgetState {}