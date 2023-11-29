import 'package:api_repository/api_repository.dart';
import 'package:api_repository/utils/const.dart';
import 'package:client_repository/client_repository.dart';

class ListProductException extends RepositoryException {
  ListProductException(super.error, super.stackTrace);
}

class DetailsProductException extends RepositoryException {
  DetailsProductException(super.error, super.stackTrace);
}

class SearchProductException extends RepositoryException {
  SearchProductException(super.error, super.stackTrace);
}

class ProductRepository {
  ProductRepository({required ApiRepository apiRepository})
      : _apiRepository = apiRepository;
  final ApiRepository _apiRepository;

  Future<ProductModels> listProduct() async {
    try {
      return await _apiRepository.listProduct();
    } on Exception catch (error, stackTrace) {
      throw ListProductException(error, stackTrace);
    }
  }

  Future<ProductModels> detailsProduct(String id) async {
    try {
      return await _apiRepository.detailsProduct(id: id);
    } on Exception catch (error, stackTrace) {
      throw DetailsProductException(error, stackTrace);
    }
  }

  Future<ProductModels> searchProduct(String query) async {
    try {
      return await _apiRepository.searchProduct(query: query);
    } on Exception catch (error, stackTrace) {
      throw SearchProductException(error, stackTrace);
    }
  }
}
