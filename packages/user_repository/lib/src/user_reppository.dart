import 'package:api_repository/api_repository.dart';
import 'package:api_repository/utils/const.dart';
import 'package:client_repository/client_repository.dart';

class AuthException extends RepositoryException {
  AuthException(super.error, super.stackTrace);
}

class UserRepository {
  UserRepository({required ApiRepository apiRepository})
      : _apiRepository = apiRepository;
  final ApiRepository _apiRepository;

  Future<AuthModels> auth(String username, String password) async {
    try {
      return await _apiRepository.auth(username: username, password: password);
    } on Exception catch (error, stackTrace) {
      throw AuthException(error, stackTrace);
    }
  }
}
