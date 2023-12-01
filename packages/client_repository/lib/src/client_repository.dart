import 'package:client_repository/client_repository.dart';
import 'package:client_repository/models/cart_models.dart';

abstract class ClientRepository {
  Future<AuthModels> auth({String username, String password});

  Future<List<ProductModels>> listProduct();

  Future<ProductModels> searchProduct({String query});

  Future<ProductModels> detailsProduct({int id});

  Future<List<CartModels>> listCart();
}
