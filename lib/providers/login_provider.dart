import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/auth_provider.dart';
import 'package:shopy/state/login_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final AuthStateNotifier authStateNotifier =
      ref.watch(authStateProvider.notifier);

  return LoginNotifier(LoginState.initial(), authStateNotifier);
});

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(LoginState state, this.authStateNotifier) : super(state);

  AuthStateNotifier authStateNotifier;

  void login(String email, String password) async {
    try {
      state = LoginState.loading();
      await authStateNotifier.login(email, password);
      state = LoginState.success();
    } catch (e) {
      state = LoginState.failure(e.toString());
    }
  }
}
