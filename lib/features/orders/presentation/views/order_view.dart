import 'package:e_commerce_dashboard/core/helper_functions/get_order_dummy_data.dart';
import 'package:e_commerce_dashboard/core/services/get_it_services.dart';
import 'package:e_commerce_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/manager/update_order/update_order_cubit.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/update_order_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrdersRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: const UpdateOrderBuilder(child: OrdersViewBodyBuilder()),
      ),
    );
  }
}

class OrdersViewBodyBuilder extends StatefulWidget {
  const OrdersViewBodyBuilder({super.key});

  @override
  State<OrdersViewBodyBuilder> createState() => _OrdersViewBodyBuilderState();
}

class _OrdersViewBodyBuilderState extends State<OrdersViewBodyBuilder> {
  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(orders: [getDummyOrder(), getDummyOrder()]),
          );
        }
      },
    );
  }
}
