import 'package:e_commerce_project/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.isCartList = false,
    required this.product,
  });

  final Product product;
  final bool isCartList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.image!,
              width: 75,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //     "${product.title!.split(' ')[0]}, ${product.title!.split(' ')[1]}"),
              SizedBox(width: 200, child: Text(product.title!)),
              Text(product.category!),
              Text("\$ ${product.price}"),
              if (isCartList) ...[
                IconButton(
                  onPressed: () {
                    context.read<CartProvider>().removeProduct(product);
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                    //size: 35,
                  ),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}
