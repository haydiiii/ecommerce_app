abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ShowProfileLoadingState extends ProfileStates {}

class ShowProfileSuccessState extends ProfileStates {}

class ShowProfileErrorState extends ProfileStates {
  final String errorMessage;
  ShowProfileErrorState({required this.errorMessage});
}

class UpdateProfileLoadingState extends ProfileStates {}

class UpdateProfileSuccessState extends ProfileStates {}

class UpdateProfileErrorState extends ProfileStates {
  final String errorMessage;
  UpdateProfileErrorState({required this.errorMessage});
}
