import 'package:e_commerce_dashboard/core/helper_functions/get_order_dummy_data.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:e_commerce_dashboard/features/orders/presentation/views/widgets/orders_items_list_view.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          FilterSection(),
          const SizedBox(height: 16),
          Expanded(
            child: OrdersItemsListView(
              orderModels: [
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
