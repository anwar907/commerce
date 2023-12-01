import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:product_repository/product_repository.dart';
import 'package:user_repository/user_repository.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // initilaize Dio configuration
  var option = Configuration.initialize();

  // Create an instance of the ApiClient with the given dioClient
  final apiClient = ApiClient(dioClient: option);

  // Create an instance of the ApiRepository using the apiClient
  final apiRepository = ApiRepository(apiClient: apiClient);

  // Create an instance of UserRepository with an instance of ApiRepository
  final userRepository = UserRepository(apiRepository: apiRepository);

  // Create an instance of ProductRepository with an instance of ApiRepository
  final productRepository = ProductRepository(apiRepository: apiRepository);

  // Run the MainApp with the UserRepository and ProductRepository instances
  runApp(MainApp(
    userRepository: userRepository,
    productRepository: productRepository,
  ));
}
