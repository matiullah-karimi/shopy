import 'package:shopy/model/user.dart';
import 'package:shopy/utils/local_storage.dart';

class AuthRepository {
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    await LocalStorage.addItem('token', '123456');

    final user = User(id: 1, name: 'name', email: email, password: password);
    await LocalStorage.addItem('user', user.toJson());

    return user;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  void register() {
    print('Register');
  }

  Future<User> getAuthenticatedUser() async {
    final userJson = await LocalStorage.getItem('user');
    return User.fromJson(userJson);
  }

  Future<bool> isAuthenticated() async {
    final token = await LocalStorage.getItem('token');

    return token.isNotEmpty;
  }
}
