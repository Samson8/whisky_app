import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/home/data/collection_store.dart';
import 'package:whisky_app/mock/bottle_details.dart';
import 'package:whisky_app/mock/mock_bottle_data.dart';
import 'package:whisky_app/models/tasting_model.dart';

class CollectionStoreImpl implements CollectionStore {
  @override
  Future<Result> getList() async {
    try {
      // Simulate a network call or data fetching
      await Future.delayed(Duration(seconds: 2));
      // Return a successful result
      return Result.success(mockBottleList);
    } catch (e) {
      // Handle any errors and return a failure result
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> addNotesToCollection(TastingNote note) async {
    try {
      // Simulate adding a note to the collection
      await Future.delayed(Duration(seconds: 1));
      // Return a successful result
      return Result.success(note);
    } catch (e) {
      // Handle any errors and return a failure result
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result> getCollectionById(String id) async {
    try {
      // Simulate fetching a collection by ID
      await Future.delayed(Duration(seconds: 1));
      // Return a successful result
      return Result.success(
          mockBottleDetails.firstWhere((bottle) => bottle.id.toString() == id));
    } catch (e) {
      // Handle any errors and return a failure result
      return Result.failure(e.toString());
    }
  }
}
