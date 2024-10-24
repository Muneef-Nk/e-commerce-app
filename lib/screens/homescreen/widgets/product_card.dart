import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/screens/prodct_details/view/product_details_page.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:ecommerce_app/utils/color_constants.dart';
import 'package:ecommerce_app/utils/helper_funtion.dart';
import 'package:ecommerce_app/utils/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price * (1 - (product.discount) / 100);
    String randomImageUrl = GetProduct.getImage(product.productId.toString());
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(FadeTransitionPageRoute(
          page: ProductDetailsPage(product: product),
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: boxDecoration(),
        width: 150,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.network(
                  "${randomImageUrl}",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${discountedPrice.round()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "₹${product.price.round()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.grey,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      product.brand,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: product.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: AppColor.primary,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          product.rating.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
