import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/home/data/collection_store.dart';
import 'package:whisky_app/mock/bottle_details.dart';

class CollectionStoreImpl implements CollectionStore {
  @override
  Future<Result> getList() async {
    try {
      // Simulate a network call or data fetching
      await Future.delayed(Duration(seconds: 2));
      // Return a successful result
      return Result.success(mockBottleDetails);
    } catch (e) {
      // Handle any errors and return a failure result
      return Result.failure(e.toString());
    }
  }
}
