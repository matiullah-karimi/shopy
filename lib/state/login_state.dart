class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String errorMessage;

  LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage = '',
  });

  factory LoginState.initial() {
    return LoginState();
  }

  factory LoginState.loading() {
    return LoginState(isLoading: true);
  }

  factory LoginState.success() {
    return LoginState(isSuccess: true);
  }

  factory LoginState.failure(String errorMessage) {
    return LoginState(
      isFailure: true,
      errorMessage: errorMessage,
    );
  }
}
