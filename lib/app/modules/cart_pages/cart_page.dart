import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'package:store/app/modules/cart_pages/bloc/cart_bloc.dart';
import 'package:store/app/modules/cart_pages/view/cart_view.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/CartPage';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartBloc(productRepository: context.read<ProductRepository>()),
      child: const CartView(),
    );
  }
}
