import 'package:api_repository/utils/api_method.dart';
import 'package:client_repository/client_repository.dart';
import 'package:client_repository/models/cart_models.dart';

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
  Future<ProductModels> detailsProduct({int? id}) async {
    try {
      final response = await apiClient?.get('products/$id');

      return ProductModels.fromJson(response?.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ProductModels>> listProduct() async {
    try {
      final response = await apiClient?.get('products');

      List<dynamic> responseData = response?.data;

      List<ProductModels> listProduct =
          responseData.map((e) => ProductModels.fromJson(e)).toList();

      return listProduct;
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

  @override
  Future<List<CartModels>> listCart() async {
    try {
      final response = await apiClient?.get('carts');

      List<dynamic> listData = response?.data;

      List<CartModels> listCart =
          listData.map((e) => CartModels.fromJson(e)).toList();
      return listCart;
    } catch (e) {
      throw Exception(e);
    }
  }
}
