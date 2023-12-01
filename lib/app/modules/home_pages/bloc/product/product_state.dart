part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState(
      {this.product,
      this.message,
      this.status = StatusState.init,
      this.cartModels,
      this.listProduct});
  final List<ProductModels>? listProduct;
  final ProductModels? product;
  final String? message;
  final List<CartModels>? cartModels;
  final StatusState status;

  ProductState copyWith(
      {List<ProductModels>? listProduct,
      String? message,
      StatusState? status,
      List<CartModels>? cartModels,
      ProductModels? product}) {
    return ProductState(
        cartModels: cartModels ?? this.cartModels,
        status: status ?? this.status,
        message: message ?? this.message,
        listProduct: listProduct ?? this.listProduct,
        product: product ?? this.product);
  }

  @override
  List<Object?> get props =>
      [status, message, product, listProduct, cartModels];
}
