import 'package:whisky_app/core/utils/result_handler.dart';

abstract class AuthRepository {
  Future<Result> signin(String email, String password);
}
