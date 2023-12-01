import 'package:client_repository/models/cart_models.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  static const routeName = '/CartPage';
  const CartView({super.key, this.listItem});

  final List<CartModels>? listItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listItem?.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(listItem?[index].userId.toString() ?? ''),
            );
          }),
    );
  }
}
