import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //     "${product.title!.split(' ')[0]}, ${product.title!.split(' ')[1]}"),
              SizedBox(width: 200, child: Text(product.title!)),
              Text(product.category!),
              Text("\$ ${product.price}")
            ],
          )
        ],
      ),
    );
  }
}