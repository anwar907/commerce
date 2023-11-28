import 'package:client_repository/client_repository.dart';

abstract class ClientRepository {

  Future<AuthModels> auth({String username, String password});

  Future<ListProductModels> listProduct();

  Future<ListProductModels> searchProduct({String query});

  Future<ListProductModels> detailsProduct({String id});

}
