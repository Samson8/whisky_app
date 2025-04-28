import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstore/localstore.dart';
import 'package:whisky_app/core/injections.dart';
import 'package:whisky_app/core/use_cases/abstract_usecase.dart';
import 'package:whisky_app/core/utils/bloc_resourse.dart';
import 'package:whisky_app/core/utils/constants.dart';
import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/models/bottle_model.dart';
import 'package:whisky_app/models/tasting_model.dart';

class LoadCollections extends AppEvent {}

class LoadCollectionDetails extends AppEvent {
  final String? collectionId;
  LoadCollectionDetails(this.collectionId);
}

AbstractUseCase<Result, String> get collectionUseCase =>
    locator.get<AbstractUseCase<Result, String>>(
        instanceName: Constants.collectionUseCase);

final _localStore = Localstore.instance;

class CollectionBloc extends Bloc<AppEvent, AppState> {
  CollectionBloc() : super(AppLoading()) {
    on<LoadCollections>((event, emit) async {
      emit(AppLoading());
      try {
        final isOffline = await getOfflineState();
        List<BottleModel> bottles = [];

        if (!isOffline) {
          // Online: Fetch from mock API
          final response = await collectionUseCase.call(null);

          // Save to local storage
          for (final e in response.data) {
            await _localStore
                .collection('savedCollection')
                .doc(e.id.toString())
                .set(e.toJson());
          }

          bottles = response.data;
        } else {
          // Offline: Load from local storage
          bottles = await getSavedCollections();
        }

        emit(AppLoaded(bottles));
      } catch (e) {
        debugPrint('Error: $e');
        emit(AppError("Failed to load collections: $e"));
      }
    });

    on<LoadCollectionDetails>((event, emit) async {
      BottleModel? bottle;
      try {
        bottle = await getSingleCollection(event.collectionId!);
        if (bottle == null) {
          emit(AppError("Collection not found"));
        } else {
          emit(AppLoaded(bottle));
        }
      } catch (e) {
        debugPrint('Error: $e');
        emit(AppError("Failed to load collection details: $e"));
      }
    });
  }

  Future<bool> saveTastingNote(
      TastingNote tastingNote, String collectionId) async {
    try {
      final docs = await _localStore
          .collection('savedCollection')
          .doc(collectionId)
          .get();

      if (docs == null || docs.isEmpty) return false;
      final Map<String, dynamic> rawBottleJson = docs;
      rawBottleJson['tastingNotes'] = tastingNote.toJson();
      _localStore
          .collection('savedCollection')
          .doc(collectionId)
          .set(rawBottleJson);
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  Future<List<BottleModel>> getSavedCollections() async {
    try {
      final docs = await _localStore.collection('savedCollection').get();
      if (docs == null || docs.isEmpty) return [];
      return docs.entries.map((e) => BottleModel.fromJson(e.value)).toList();
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }

  Future<BottleModel?> getSingleCollection(String id) async {
    try {
      final docs =
          await _localStore.collection('savedCollection').doc(id).get();
      if (docs == null || docs.isEmpty) return null;
      return BottleModel.fromJson(docs);
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<void> toggleOfflineState(bool status) async {
    try {
      await _localStore
          .collection('appSettings')
          .doc('status')
          .set({'status': status});
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<bool> getOfflineState() async {
    try {
      final doc =
          await _localStore.collection('appSettings').doc('status').get();
      if (doc != null && doc['status'] != null) {
        return doc['status'];
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return false;
  }
}
