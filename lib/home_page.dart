import 'package:e_commerce_project/models/product.dart';
import 'package:e_commerce_project/services/api_service.dart';
import 'package:flutter/material.dart';

import 'widgets/product_box.dart';
import 'widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categoryProducts = [];
  List categoryList = [];

  @override
  void initState() {
    super.initState();
    // print("++++++++++get data++++++");
    // // print(getCategories());
    ApiService.getCategories().then((value) {
      setState(() {
        categoryList.add("ALL");
        categoryList.addAll(value);
      });
    });
    ApiService.getAllProducts().then((value) {
      setState(() {
        categoryProducts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 221, 224),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    "OMG",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.person_pin_rounded),
                )
              ],
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: InkWell(
                          onTap: () {
                            //print(categoryList[index]);
                            if (categoryList[index] == "ALL") {
                              ApiService.getAllProducts().then((value) {
                                setState(() {
                                  categoryProducts = value;
                                });
                              });
                            } else {
                              ApiService.getProductsByCategory(
                                      category: categoryList[index])
                                  .then((value) {
                                setState(() {
                                  categoryProducts = value;
                                });
                              });
                            }
                          },
                          child: Text(
                            categoryList[index].toString().toUpperCase(),
                          ),
                        ),
                      );
                    }),
              )),
          // displaying category details
          SizedBox(
            height: 330,
            // width: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  Product product = Product.fromJson(categoryProducts[index]);
                  return ProductBox(product: product);
                }),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              "Popular",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  Product product = Product.fromJson(categoryProducts[index]);
                  return ProductCard(product: product);
                }),
          )
        ],
      ),
    );
  }
}





// SizedBox(
          //   width: 400,
          //   height: 500,
          //   child: FutureBuilder<List>(
          //       future: getData(),
          //       builder: (context, snapshot) {
          //         if (snapshot.connectionState == ConnectionState.waiting) {
          //           return const Center(
          //             child: CircularProgressIndicator(),
          //           );
          //         } else {
          //           return ListView.builder(
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: (context, index) {
          // Product product =
          //     Product.fromJson(snapshot.data![index]);
          //                 return Column(
          //                   children: [
          // Image.network(
          //   //snapshot.data![index]["image"],
          //   product.image!,
          //   width: 150,
          // ),
          // Text(
          //     // snapshot.data![index]["title"],
          //     product.title!)
          //                   ],
          //                 );
          //               });
          //         }
          //       }),
          // )