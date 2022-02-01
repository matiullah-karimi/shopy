import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/user.dart';
import 'package:shopy/repositories/auth_repository.dart';
import 'package:shopy/state/auth_state.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(
    ref.read(authRepositoryProvider),
    AuthState.initial(),
  ),
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this.authRepository, AuthState initialState)
      : super(initialState) {
    _init();
  }

  final AuthRepository authRepository;

  void _init() async {
    state = AuthState.loading();

    final isAuthenticated = await authRepository.isAuthenticated();

    if (!isAuthenticated) {
      state = AuthState.initial();
      return;
    }

    final user = await authRepository.getAuthenticatedUser();

    state = AuthState.authenticated(user);
  }

  Future<void> login(String email, String password) async {
    try {
      User user = await authRepository.login(email, password);
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void logout() async {
    await authRepository.logout();
    state = AuthState.initial();
  }
}
