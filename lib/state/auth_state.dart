import 'package:shopy/model/user.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String error;
  final User? user;

  AuthState({
    required this.isAuthenticated,
    required this.isLoading,
    required this.error,
    this.user,
  });

  factory AuthState.initial() {
    return AuthState(
      isAuthenticated: false,
      isLoading: false,
      error: '',
    );
  }

  factory AuthState.loading() {
    return AuthState(
      isAuthenticated: false,
      isLoading: true,
      error: '',
    );
  }

  factory AuthState.authenticated(User user) {
    return AuthState(
      isAuthenticated: true,
      isLoading: false,
      error: '',
      user: user,
    );
  }

  factory AuthState.error(String error) {
    return AuthState(
      isAuthenticated: false,
      isLoading: false,
      error: error,
    );
  }

  bool get authenticated => isAuthenticated && !isLoading;
  bool get notAuthenticated => !isAuthenticated && !isLoading;
  bool get loading => isLoading;
  bool get hasError => error.isNotEmpty;
}
