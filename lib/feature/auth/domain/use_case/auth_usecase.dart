import 'package:whisky_app/core/use_cases/abstract_usecase.dart';
import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/auth/domain/repository/auth_repository.dart';

class AuthUsecase implements AbstractUseCase<Result, Map<String, String>> {
  final AuthRepository authRepository;
  AuthUsecase(this.authRepository);

  @override
  Future<Result> call(parameter) async {
    final response = await authRepository.signin(
        parameter!['email']!, parameter['password']!);
    return response;
  }
}
