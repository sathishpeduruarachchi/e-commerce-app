import 'package:e_commerce_project/providers/cart_provider.dart';
import 'package:e_commerce_project/providers/heart_provider.dart';
import 'package:e_commerce_project/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) => HeartProvider(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) => CartProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
