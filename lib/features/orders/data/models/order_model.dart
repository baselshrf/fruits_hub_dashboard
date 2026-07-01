import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderID;

  OrderModel({
    this.status,
    required this.totalPrice,
    required this.uId,
    required this.orderID,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: json['totalPrice'],
    uId: json['uId'],
    status: json['status'],
    orderID: json['orderId'],
    shippingAddressModel: ShippingAddressModel.fromJson(
      json['shippingAddressModel'],
    ),
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((e) => OrderProductModel.fromJson(e)),
    ),
    paymentMethod: json['paymentMethod'],
  );
  Map<String, dynamic> toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };

  OrderEntity toEntity() => OrderEntity(
    totalPrice: totalPrice,
    orderID: orderID,
    uId: uId,
    status: fetchEnum(),
    shippingAddressModel: shippingAddressModel.toEntity(),
    orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
    paymentMethod: paymentMethod,
  );

  OrderEnum fetchEnum() {
    return OrderEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
