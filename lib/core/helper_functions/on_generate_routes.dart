import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/order_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
