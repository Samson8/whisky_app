import 'package:whisky_app/core/utils/result_handler.dart';

abstract class CollectionRepository {
  Future<Result> getList();
}
