import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';

class Body extends StatelessWidget {
  final ProductModel product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                child: Image.network(
                  "${product.thumbnail}",
                  height: 350.0,
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "${product.title}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(CupertinoIcons.heart_fill),
                    Icon(CupertinoIcons.heart_fill),
                    Icon(CupertinoIcons.heart_fill),
                    Icon(CupertinoIcons.heart),
                    Icon(CupertinoIcons.heart),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(CupertinoIcons.add),
                    ),
                    Text("01",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(CupertinoIcons.minus),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              child: Text("${product.description}",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("\$ ${product.price}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text("(- ${product.discountPercentage} %)",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.red))
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: null,
                  child: Text('Add To Cart',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
