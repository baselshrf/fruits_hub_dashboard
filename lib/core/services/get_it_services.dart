import 'package:e_commerce_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:e_commerce_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:e_commerce_dashboard/core/services/data_services.dart';
import 'package:e_commerce_dashboard/core/services/firestore_services.dart';
import 'package:e_commerce_dashboard/core/services/stoarage_service.dart';
import 'package:e_commerce_dashboard/core/services/supabase_stoarge.dart';
import 'package:e_commerce_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:e_commerce_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StoarageService>(SupabaseStoargeService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StoarageService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt.get<DatabaseService>()),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(getIt.get<DatabaseService>()),
  );
}
