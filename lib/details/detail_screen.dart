import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_ac/details/body.dart';
import 'package:flutter_lab_ac/models/products.dart';
import 'package:flutter_lab_ac/widgets/Appbar.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar_Product(product: product),
          Body(product: product),
        ],
      ),
    );
  }
}
