import 'package:e_commerce_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:e_commerce_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:e_commerce_dashboard/core/services/fire_storage.dart';
import 'package:e_commerce_dashboard/core/services/stoarage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StoarageService>(FireStorage());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StoarageService>()),
  );
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl());
}
