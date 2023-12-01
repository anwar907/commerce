import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/app/modules/cart_pages/bloc/cart_bloc.dart';
import 'package:store/app/modules/cart_pages/view/cart_view.dart';
import 'package:store/app/modules/home_pages/bloc/product/product_bloc.dart';
import 'package:store/app/modules/home_pages/view/details_product_view.dart';
import 'package:store/app/modules/home_pages/view/widgets/card_item_widgets.dart';
import 'package:store/core/status_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: const Text('Toko Sebelah'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state.status == StatusState.loading) {
                return IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart));
              }
              if (state.status == StatusState.success) {
                return Badge(
                  alignment: Alignment.topLeft,
                  label: Text(state.cartModels?.length.toString() ?? ''),
                  child: IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(ListDataCartEvent());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartView(
                                  listItem: state.cartModels,
                                )));
                      },
                      icon: const Icon(Icons.shopping_cart)),
                );
              }

              if (state.status == StatusState.failure) {
                return IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart));
              }

              return IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart));
            })
          ],
        ),
        body: SafeArea(child:
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state.status == StatusState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == StatusState.success) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.listProduct?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                ),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ProductBloc>().add(DetailsProductEvent(
                          state.listProduct?[index].id?.toInt() ?? 0));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsProductView(
                                product: state.listProduct?[index],
                              )));
                    },
                    child: CardItemWidgets(
                      product: state.listProduct?[index],
                    ),
                  );
                });
          }

          if (state.status == StatusState.failure) {
            return const Center(
              child: Text('Something Wrong'),
            );
          }

          return Container();
        })));
  }
}
