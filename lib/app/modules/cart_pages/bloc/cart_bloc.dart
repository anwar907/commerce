import 'package:bloc/bloc.dart';
import 'package:client_repository/models/cart_models.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';
import 'package:store/core/status_state.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const CartState()) {
    on<ListDataCartEvent>(dataCart);
  }

  final ProductRepository _productRepository;

  Future<void> dataCart(
      ListDataCartEvent event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final listData = await _productRepository.listDataCart();
      emit(state.copyWith(cartModels: listData, status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure, message: e.toString()));
    }
  }
}
