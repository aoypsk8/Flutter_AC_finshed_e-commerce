import 'package:flutter/material.dart';
import 'package:flutter_lab_ac/details/detail_screen.dart';
import 'package:flutter_lab_ac/do_clients.dart';
import 'package:flutter_lab_ac/models/products.dart';
import 'package:flutter_lab_ac/widgets/BannerAdd.dart';
import 'package:flutter_lab_ac/widgets/CategoriesWidget.dart';
import 'package:flutter_lab_ac/widgets/Drawer.dart';
import 'package:flutter_lab_ac/widgets/Grid_product.dart';
import 'package:flutter_lab_ac/widgets/HomeAppBar.dart';
import 'package:flutter_lab_ac/widgets/Search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = DioClient();

  final _searchTextController = TextEditingController();

  List<ProductModel> _products = [];

  dynamic data;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final res = await _dio.getProducts();

      if (res != null) {
        setState(() {
          _products = res.products!;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //////appbar ==============================================
            const HomeAppBar(),

            //////search ==============================================
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          controller: _searchTextController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...."),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          final text = _searchTextController.text;
                          final res = await _dio.searchProduct(text);
                          if (res != null) {
                            setState(() {
                              _products = res.products!;
                            });
                          }
                        },
                        child: const Icon(
                          Icons.search,
                          size: 27,
                        ),
                      )
                    ]),
                  ),
                  //////baanner ==============================================
                  const BannerAdd(),

                  //////Categories ==============================================
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: const Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const CategoriesWidget(),

                  //  Products card =======================================
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          mainAxisExtent: 310,
                        ),
                        itemCount: _products.length,
                        itemBuilder: (context, index) => Card_product(
                              product: _products[index],
                              press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(product: _products[index]),
                                ),
                              ),
                            )),
                  ),
                  // GridView.builder(
                  //     physics: ScrollPhysics(),
                  //     shrinkWrap: true,
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 2),
                  //     itemCount: products.length,
                  //     itemBuilder: (context, index) => Card_widget(
                  //         product: products[index],
                  //         press: () => null
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) =>
                  //                 DetailsScreen(product: products[index]),
                  //           ),
                  //         ),
                  //         )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
