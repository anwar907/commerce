import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'package:store/app/modules/home_pages/bloc/product/product_bloc.dart';
import 'package:store/app/modules/login_pages/bloc/user_bloc/user_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MainApp extends StatelessWidget {
  const MainApp(
      {super.key,
      required UserRepository userRepository,
      required ProductRepository productRepository})
      : _productRepository = productRepository,
        _userRepository = userRepository;

  final UserRepository _userRepository;
  final ProductRepository _productRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          BlocProvider<UserBloc>(
              create: (_) => UserBloc(userRepository: _userRepository)),
          BlocProvider<ProductBloc>(
              create: (_) => ProductBloc(productRepository: _productRepository))
        ],
        child: const MaterialApp(
          home: Scaffold(body: Center(child: Text('data'))),
        ));
  }
}
