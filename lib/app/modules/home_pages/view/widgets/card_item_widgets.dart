import 'package:client_repository/client_repository.dart';
import 'package:flutter/material.dart';

class CardItemWidgets extends StatelessWidget {
  const CardItemWidgets({super.key, this.product});
  final ProductModels? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 75,
            child: Hero(
              tag: "${product?.image},${product?.id}",
              transitionOnUserGestures: true,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product?.image ?? ''),
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0))),
              ),
            ),
          ),
          Expanded(
            flex: 25,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product?.title ?? '',
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Rp. ${product?.price.toString()}",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
