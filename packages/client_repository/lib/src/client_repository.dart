import 'package:client_repository/client_repository.dart';

abstract class ClientRepository {
  Future<AuthModels> auth({String username, String password});

  Future<ProductModels> listProduct();

  Future<ProductModels> searchProduct({String query});

  Future<ProductModels> detailsProduct({String id});
}
