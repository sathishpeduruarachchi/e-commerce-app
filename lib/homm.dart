import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> products = [];

  callApi() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);

    setState(() {
      List data = jsonDecode(response.body);
      //print(data[0]['title']);

      // data.forEach((prodct){
      //   products.add(Text(prodct['title']));
      // });
      List<Widget> allData = [];
      for (var prodct in data) {
        // allData.add(ListTile(title: Text(prodct['title'])));
        allData.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              prodct['image'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        );
      }

      setState(() {
        products = allData;
      });
    });

    print(response.body);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                callApi();
              },
              child: const Text("Call API"),
            ),
          ),
          SizedBox(
            width: 300,
            height: 500,
            child: ListView(children: products),
          )
        ],
      ),
    );
  }
}
