import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whisky_app/core/injections.dart';
import 'package:whisky_app/core/use_cases/abstract_usecase.dart';
import 'package:whisky_app/core/utils/bloc_resourse.dart';
import 'package:whisky_app/core/utils/constants.dart';
import 'package:whisky_app/core/utils/result_handler.dart';

class LoadCollections extends AppEvent {}

class LoadCollectionDetails extends AppEvent {
  final String? collectionId;
  LoadCollectionDetails(this.collectionId);
}

AbstractUseCase<Result, String> get collectionUseCase =>
    locator.get<AbstractUseCase<Result, String>>(
        instanceName: Constants.collectionUseCase);

class CollectionProvider extends Bloc<AppEvent, AppState> {
  CollectionProvider() : super(AppLoading()) {
    on<LoadCollections>((event, emit) async {
      try {
        emit(AppLoading());
        final response = await collectionUseCase.call(null);
        debugPrint('Response: ${response.data[0]}');
        emit(AppLoaded(response.data));
      } catch (e) {
        emit(AppError("Failed to load lists: $e"));
      }
    });
  }
}
