import 'package:whisky_app/core/use_cases/abstract_usecase.dart';
import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/home/domain/respository/collection_repository.dart';

class GetCollectionUsecase implements AbstractUseCase<Result, String> {
  final CollectionRepository collectionRepository;
  GetCollectionUsecase(this.collectionRepository);

  @override
  Future<Result> call(parameter) async {
    final response = await collectionRepository.getList();
    return response;
  }
}
