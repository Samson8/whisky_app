import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/injections.dart';
import 'package:whisky_app/core/use_cases/abstract_usecase.dart';
import 'package:whisky_app/core/utils/bloc_resourse.dart';
import 'package:whisky_app/core/utils/constants.dart';
import 'package:whisky_app/core/utils/result_handler.dart';

class SignInEvent extends AppEvent {
  final String? email;
  final String? password;
  SignInEvent(this.email, this.password);
}

AbstractUseCase<Result, Map<String, String>> get authUseCase =>
    locator.get<AbstractUseCase<Result, Map<String, String>>>(
        instanceName: Constants.authUseCase);

class AuthBloc extends Bloc<AppEvent, AppState> {
  AuthBloc() : super(AppLoading()) {
    on<SignInEvent>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(AppError("Email or password cannot be null"));
        return;
      }

      emit(AppLoading());
      try {
        final response = await authUseCase.call({
          'email': event.email!,
          'password': event.password!,
        });

        if (response.isSuccess) {
          emit(AppLoaded(response.data));
        } else {
          emit(AppError("Failed to load data: ${response.error}"));
        }
      } catch (e) {
        emit(AppError("Failed to load data: $e"));
      }
    });
  }
}
