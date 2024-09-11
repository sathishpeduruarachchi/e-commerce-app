import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 500,
            child: FutureBuilder<List>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.network(
                                snapshot.data![index]["image"],
                                width: 150,
                              ),
                              Text(
                                snapshot.data![index]["title"],
                              )
                            ],
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }

  Future<List> getData() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
