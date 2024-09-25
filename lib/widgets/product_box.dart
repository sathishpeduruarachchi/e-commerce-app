import 'package:e_commerce_project/models/product.dart';
import 'package:e_commerce_project/screens/product_screen.dart';
import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductScreen(product: product,)));
        },
        child: Container(
          height: 315,
          width: 150,
          decoration: BoxDecoration(
              color: const Color.fromARGB(31, 198, 197, 201),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  //snapshot.data![index]["image"],
                  product.image!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    // snapshot.data![index]["title"],
                    product.title!),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("\$ ${product.price}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
