abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  dynamic trucks;
  RegisterSuccessState(this.trucks);
}

class RegisterErrorState extends RegisterStates {
  String? message;
  RegisterErrorState(this.message);
}

class ChangePasswordVisibilityState extends RegisterStates {}
