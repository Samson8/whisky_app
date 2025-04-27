import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/home/data/collection_store.dart';
import 'package:whisky_app/feature/home/domain/respository/collection_repository.dart';

class CollectionRepositoryImp implements CollectionRepository {
  final CollectionStore collectionStore;
  CollectionRepositoryImp(this.collectionStore);

  @override
  Future<Result> getList() async {
    try {
      final response = await collectionStore.getList();
      return response;
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
