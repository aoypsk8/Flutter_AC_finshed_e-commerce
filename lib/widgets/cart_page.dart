import 'package:flutter/material.dart';
import 'package:flutter_lab_ac/widgets/Appbar_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [AppBarCart()],
      ),
    );
  }
}
