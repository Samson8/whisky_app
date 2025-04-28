import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/auth/data/auth_store.dart';
import 'package:whisky_app/mock/user.dart';

class AuthStoreImpl extends AuthStore {
  @override
  Future<Result> signin(String email, String password) async {
    try {
      // Simulate a network call or data fetching
      await Future.delayed(const Duration(seconds: 2));
      final response = mockUserList.firstWhere(
          (user) => user?.email == email && user?.password == password,
          orElse: () => null);
      if (response == null) {
        return Result.failure("Invalid email or password");
      }
      return Result.success("User signed in successfully");
    } catch (e) {
      // Handle any errors and return a failure result
      return Result.failure(e.toString());
    }
  }
}
