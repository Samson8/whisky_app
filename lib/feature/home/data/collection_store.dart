import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/models/tasting_model.dart';

abstract class CollectionStore {
  Future<Result> getList();
  Future<Result> getCollectionById(String id);
  Future<Result> addNotesToCollection(TastingNote note);
}
