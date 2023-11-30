part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState(
      {this.product, this.message, this.status = StatusState.init});
  final ProductModels? product;
  final String? message;
  final StatusState status;

  ProductState copyWith(
      {ProductModels? product, String? message, StatusState? status}) {
    return ProductState(
        status: status ?? this.status,
        message: message ?? this.message,
        product: product ?? this.product);
  }

  @override
  List<Object?> get props => [status, message, product];
}
