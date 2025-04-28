import 'package:whisky_app/core/utils/result_handler.dart';

abstract class AuthStore {
  Future<Result> signin(String email, String password);
}
