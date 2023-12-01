part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState(
      {this.cartModels, this.message, this.status = StatusState.init});

  final List<CartModels>? cartModels;
  final String? message;
  final StatusState? status;

  CartState copyWith(
      {List<CartModels>? cartModels, String? message, StatusState? status}) {
    return CartState(
        message: message ?? this.message,
        cartModels: cartModels ?? this.cartModels,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, message, cartModels];
}
