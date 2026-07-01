import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/data_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService _dataService;

  OrdersRepoImpl(this._dataService);

  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in _dataService.streamData(
        path: BackendEndpoint.getOrders,
      )) {
        List<OrderEntity> orders = (data as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('Failed to fetch orders'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrderEnum status,
    required String orderID,
  }) async {
    try {
      await _dataService.updateData(
        data: {'status': status.name},
        path: BackendEndpoint.updateOrder,
        documentId: orderID,
      );
      return right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update order'));
    }
  }
}
