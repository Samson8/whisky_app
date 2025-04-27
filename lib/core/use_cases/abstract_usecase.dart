import 'package:whisky_app/core/utils/result_handler.dart';

abstract class AbstractUseCase<Type, Parameter> {
  Future<Result> call(Parameter? parameter);
}
