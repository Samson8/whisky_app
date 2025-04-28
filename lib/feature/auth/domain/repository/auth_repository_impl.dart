import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/auth/data/auth_store.dart';
import 'package:whisky_app/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthStore _authStore;
  AuthRepositoryImpl(this._authStore);

  @override
  Future<Result> signin(String email, String password) {
    return _authStore.signin(email, password);
  }
}
