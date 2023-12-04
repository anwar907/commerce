import 'package:client_repository/client_repository.dart';
import 'package:flutter/material.dart';
import 'package:store/themes/text_style.dart';

class DetailsProductView extends StatelessWidget {
  static const routeName = '/DetailsPage';
  const DetailsProductView({super.key, this.product});

  final ProductModels? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Details Product'),
          centerTitle: true,
        ),
        body: Hero(
            transitionOnUserGestures: true,
            tag: '${product?.image}',
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(product?.image ?? ''))),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product?.title ?? '',
                          textAlign: TextAlign.left,
                          style:
                              MediumText.header1.copyWith(color: Colors.green),
                        ),
                        Text(
                          product?.description ?? '',
                          style: RegularText.body1,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          color: Colors.white,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total ',
                  style: MediumText.header,
                ),
                Text('Rp. ${product?.price}',
                    style: MediumText.header.copyWith(color: Colors.green))
              ],
            ),
            subtitle: OutlinedButton(
                onPressed: () {}, child: const Text('Add to Cart')),
          ),
        ));
  }
}
