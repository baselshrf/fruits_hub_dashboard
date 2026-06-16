part of 'add_product_cubit.dart';

sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductFailure extends AddProductState {
  final String errMessage;

  AddProductFailure(this.errMessage);
}

final class AddProductSucceess extends AddProductState {}
