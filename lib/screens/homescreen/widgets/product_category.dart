import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/screens/homescreen/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  ProductCategory({required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              return ProductCard(
                product: product,
              );
            },
          ),
        ),
      ],
    );
  }
}
