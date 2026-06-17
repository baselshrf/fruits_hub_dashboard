import 'package:dartz/dartz.dart';
import 'package:e_commerce_dashboard/core/errors/failures.dart';
import 'package:e_commerce_dashboard/core/services/data_services.dart';
import 'package:e_commerce_dashboard/core/utils/backend_endpoint.dart';
import 'package:e_commerce_dashboard/features/orders/data/models/order_model.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _dataService;

  OrdersRepoImpl(this._dataService);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      final data = await _dataService.getData(path: BackendEndpoint.getOrders);
      List<OrderEntity> orders =
          (data as List<dynamic>)
                  .map((e) => OrderModel.fromJson(e).toEntity())
                  .toList()
              as List<OrderEntity>;
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch orders'));
    }
  }
}
