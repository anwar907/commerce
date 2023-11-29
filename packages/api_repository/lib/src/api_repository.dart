import 'package:api_repository/utils/api_method.dart';
import 'package:client_repository/client_repository.dart';

class ApiRepository implements ClientRepository {
  ApiClient? apiClient;

  ApiRepository({this.apiClient});

  @override
  Future<AuthModels> auth({String? username, String? password}) async {
    try {
      final body = {
        'username': username,
        'password': password,
      };
      final response = await apiClient?.post('auth/login', body);

      return AuthModels.fromJson(response?.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductModels> detailsProduct({String? id}) async {
    try {
      final response = await apiClient?.get('products/$id');

      return ProductModels.fromJson(response?.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductModels> listProduct() async {
    try {
      final response = await apiClient?.get('products');

      return response?.data.map((e) => listProductModelsFromJson(e));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductModels> searchProduct({String? query}) async {
    try {
      final response = await apiClient?.get('products?sort=$query');
      return ProductModels.fromJson(response?.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
