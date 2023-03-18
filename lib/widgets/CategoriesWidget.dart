import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images = [
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngwing.com%2Fen%2Fsearch%3Fq%3Dshirt&psig=AOvVaw0Zu2GqymjK_wfJMeY9TuOm&ust=1678972413437000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLjDv-aB3v0CFQAAAAAdAAAAABAE",
      "https://w7.pngwing.com/pngs/983/608/png-transparent-wallet-computer-icons-wallet-brown-leather-material-thumbnail.png",
      "https://e1.pngegg.com/pngimages/749/17/png-clipart-aesthetic-red-and-black-plaid-skirt.png"
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const[
          CategoryCard(
            imagePath: "https://e1.pngegg.com/pngimages/749/17/png-clipart-aesthetic-red-and-black-plaid-skirt.png",
            label: "Category Skirt",
          ),
          CategoryCard(
            imagePath: "https://w7.pngwing.com/pngs/983/608/png-transparent-wallet-computer-icons-wallet-brown-leather-material-thumbnail.png",
            label: "Category Wallate",
          ),
          CategoryCard(
            imagePath: "https://w7.pngwing.com/pngs/826/253/png-transparent-t-shirt-polo-shirt-clothing-sleeve-black-t-shirt-black-crew-neck-t-shirt-tshirt-fashion-cloth-thumbnail.png",
            label: "Category Shirt",
          ),
          CategoryCard(
            imagePath: "https://www.freepnglogos.com/uploads/shoes-png/dance-shoes-png-transparent-dance-shoes-images-5.png",
            label: "Category Shoes ",
          ),
          CategoryCard(
            imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Arduino-uno-perspective-transparent.png/1200px-Arduino-uno-perspective-transparent.png",
            label: "Category IOT",
          ),
        ],
      )
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryCard({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            imagePath,
            width: 40,
            height: 25,
          ),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
