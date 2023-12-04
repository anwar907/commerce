import 'package:client_repository/client_repository.dart';
import 'package:client_repository/models/cart_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'package:store/core/status_state.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const ProductState()) {
    on<ShowListProductEvent>(fetchListProduct);
    on<DetailsProductEvent>(productDetails);
    on<SearchQueryEvent>(searchProduct);
  }

  final ProductRepository _productRepository;

  Future<void> fetchListProduct(
      ShowListProductEvent event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final listDataProduct = await _productRepository.listProduct();

      emit(state.copyWith(
          listProduct: listDataProduct, status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure, message: e.toString()));
    }
  }

  Future<void> productDetails(
      DetailsProductEvent event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final dataProduct = await _productRepository.detailsProduct(id: event.id);

      emit(state.copyWith(product: dataProduct, status: StatusState.success));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure, message: e.toString()));
    }
  }

  Future<void> searchProduct(
      SearchQueryEvent event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(status: StatusState.loading));
      final queryData = await _productRepository.searchProduct(event.query);
      emit(state.copyWith(status: StatusState.success, product: queryData));
    } catch (e) {
      emit(state.copyWith(status: StatusState.failure, message: e.toString()));
    }
  }

 
}
