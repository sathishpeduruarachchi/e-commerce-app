import 'package:e_commerce_project/providers/cart_provider.dart';
import 'package:e_commerce_project/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "My Bag",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 400,
            //width: 100,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: context.watch<CartProvider>().allProducts.length,
              itemBuilder: (context, index) => ProductCard(
                product: context.watch<CartProvider>().allProducts[index],
                isCartList: true,
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Total Item Count:"),
              Text(
                context
                    .watch<CartProvider>()
                    .itemCount
                    .toString()
                    .padLeft(2, "0"),
              ),
              
            ],
          ),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Total Expencess:"),
                  Text(
                    context.watch<CartProvider>().totalPrice.toStringAsFixed(2),
                  ),
                ],
              )
        ],
      ),
    );
  }
}
