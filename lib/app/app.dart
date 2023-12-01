import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'package:store/app/modules/cart_pages/bloc/cart_bloc.dart';
import 'package:store/app/modules/cart_pages/cart_page.dart';
import 'package:store/app/modules/home_pages/bloc/product/product_bloc.dart';
import 'package:store/app/modules/home_pages/home_page.dart';
import 'package:store/app/modules/home_pages/view/details_product_view.dart';
import 'package:store/app/modules/login_pages/bloc/user_bloc/user_bloc.dart';
import 'package:store/app/modules/login_pages/login_page.dart';
import 'package:store/config/routes.dart';
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
          RepositoryProvider.value(value: _productRepository),
          RepositoryProvider.value(value: _userRepository)
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
                create: (_) => UserBloc(userRepository: _userRepository)),
            BlocProvider<ProductBloc>(
                create: (_) =>
                    ProductBloc(productRepository: _productRepository)),
            BlocProvider<CartBloc>(
                create: (_) => CartBloc(productRepository: _productRepository))
          ],
          child: MaterialApp(
            title: 'Toko Sebelah',
            theme: ThemeData(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedLabelStyle: TextStyle(color: Colors.green),
                  unselectedLabelStyle: TextStyle(color: Colors.grey)),
              outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              )),
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoute().genereateRoute,
            initialRoute: '/',
            routes: {
              Routes.root: (context) => const LoginPage(),
              Routes.login: (context) => const LoginPage(),
              Routes.home: (context) => const HomePage(),
              Routes.details: (context) => const DetailsProductView(),
              Routes.cart: (context) => const CartPage()
            },
          ),
        ));
  }
}
