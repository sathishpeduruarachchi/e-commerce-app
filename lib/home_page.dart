import 'dart:convert';

import 'package:e_commerce_project/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    getCategories().then((value) {
      setState(() {
        categoryList.add("ALL");
        categoryList.addAll(value);
      });
    });
    getAllProducts().then((value) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 45),
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
              padding: const EdgeInsets.all(8.0),
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
                              getAllProducts().then((value) {
                                setState(() {
                                  categoryProducts = value;
                                });
                              });
                            }
                            getProductsByCategory(category: categoryList[index])
                                .then((value) {
                              setState(() {
                                categoryProducts = value;
                              });
                            });
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
            height: 310,
            // width: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryProducts.length,
                itemBuilder: (context, index) {
                  Product product = Product.fromJson(categoryProducts[index]);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 310,
                      width: 150,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(33, 110, 40, 217),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
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
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
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
        ],
      ),
    );
  }

  Future<List> getAllProducts() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  Future<List> getCategories() async {
    var url = Uri.https('fakestoreapi.com', 'products/categories');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  Future<List> getProductsByCategory({required String category}) async {
    var url = Uri.https('fakestoreapi.com', 'products/category/$category');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
