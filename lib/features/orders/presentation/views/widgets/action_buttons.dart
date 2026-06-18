import 'package:e_commerce_dashboard/core/enums/order_enum.dart';
import 'package:e_commerce_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: orderEntity.status,
                orderID: orderEntity.orderID,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderEnum.pending,
          child: ElevatedButton(onPressed: () {}, child: const Text('Reject')),
        ),
        Visibility(
          visible: orderEntity.status == OrderEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderEnum.delivered,
                orderID: orderEntity.orderID,
              );
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
