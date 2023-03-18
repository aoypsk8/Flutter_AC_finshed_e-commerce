import 'package:flutter/material.dart';

class BannerAdd extends StatelessWidget {
  const BannerAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15, top: 20),
      child: Row(
        children: [
          _buildAdvertisement(
              context,
              "https://freepngimg.com/thumb/shoes/28530-3-nike-shoes-transparent.png",
              "15"),
          _buildAdvertisement(
              context,
              "https://pluspng.com/img-png/nike-shoe-png-nike-shoes-transparent-background-800.png",
              "10"),
          _buildAdvertisement(
              context,
              "https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png",
              "99"),
        ],
      ),
    );
  }

  Widget _buildAdvertisement(
      BuildContext context, String imageUrl, String sale) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 6.5,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 166, 213, 252),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "- ${sale} %",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Shop Now"),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              imageUrl,
            ),
          ),
        ],
      ),
    );
  }
}
