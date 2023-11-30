import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_repository/product_repository.dart';
import 'package:store/app/modules/home_pages/bloc/product/product_bloc.dart';
import 'package:store/app/modules/home_pages/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) =>
          ProductBloc(productRepository: context.read<ProductRepository>()),
      child: const HomeView(),
    );
  }
}
