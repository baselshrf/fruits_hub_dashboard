import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:e_commerce_dashboard/core/services/data_services.dart';
import 'package:e_commerce_dashboard/core/utils/backend_endpoint.dart';
import 'package:e_commerce_dashboard/features/add_product/data/product_model.dart';
import 'package:e_commerce_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.productsCollection,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
