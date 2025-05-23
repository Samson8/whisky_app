import 'package:get_it/get_it.dart';
import 'package:whisky_app/core/use_cases/abstract_usecase.dart';
import 'package:whisky_app/core/utils/constants.dart';
import 'package:whisky_app/core/utils/result_handler.dart';
import 'package:whisky_app/feature/auth/data/auth_store.dart';
import 'package:whisky_app/feature/auth/data/auth_store_impl.dart';
import 'package:whisky_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:whisky_app/feature/auth/domain/repository/auth_repository_impl.dart';
import 'package:whisky_app/feature/auth/domain/use_case/auth_usecase.dart';
import 'package:whisky_app/feature/home/data/collection_store.dart';
import 'package:whisky_app/feature/home/data/collection_store_impl.dart';
import 'package:whisky_app/feature/home/domain/respository/collection_repository.dart';
import 'package:whisky_app/feature/home/domain/respository/collection_repository_impl.dart';
import 'package:whisky_app/feature/home/domain/use_case/get_collection_usecase.dart';

final locator = GetIt.instance;

Future<void> initInjections() async {
  locator

    //Collection List classes and store
    ..registerLazySingleton<CollectionStore>(
      () => CollectionStoreImpl(),
    )
    ..registerLazySingleton<CollectionRepository>(
      () => CollectionRepositoryImp(locator()),
    )
    ..registerLazySingleton<AbstractUseCase<Result, String>>(
      () => GetCollectionUsecase(locator()),
      instanceName: Constants.collectionUseCase,
    )

    //Auth classes and store
    ..registerLazySingleton<AuthStore>(
      () => AuthStoreImpl(),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()),
    )
    ..registerLazySingleton<AbstractUseCase<Result, Map<String, String>>>(
      () => AuthUsecase(locator()),
      instanceName: Constants.authUseCase,
    );
}
