import 'package:flutter/material.dart';

import '../models/products.dart';

// ignore: camel_case_types
class AppBar_Product extends StatelessWidget {
  final ProductModel product;
  const AppBar_Product({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.only(top: 50.0),
        color: Colors.white,
        child: Row(children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child:const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "${product.title}",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.share,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
