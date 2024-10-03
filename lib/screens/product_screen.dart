import 'package:e_commerce_project/models/product.dart';
import 'package:e_commerce_project/providers/heart_provider.dart';
import 'package:e_commerce_project/providers/product_provider.dart';
import 'package:e_commerce_project/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    print("is pressed");
    return Scaffold(
      body: Stack(
        children: [
          Image.network(widget.product.image!),
          //Positioned(child: Text("Say Hello...."), left: 100, top: 200,),

          Positioned(
              top: 60,
              right: 20,
              child: InkWell(
                  onTap: () {
                    context.read<HeartProvider>().updateStatus();
                  },
                  child: Consumer<HeartProvider>(
                    builder: (context, value, child) => Icon(
                      Icons.favorite_border,
                      color: value.status
                          ? Colors.red
                          : const Color.fromARGB(66, 40, 38, 38),
                      size: 40,
                    ),
                  ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Color.fromARGB(150, 40, 169, 228),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: InkWell(
                onTap: () {
                  context
                      .read<ProductProvider>()
                      .updateProduct(product: widget.product);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.title!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
