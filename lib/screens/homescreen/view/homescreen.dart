import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/screens/homescreen/widgets/product_category.dart';
import 'package:ecommerce_app/utils/color_constants.dart';
import 'package:ecommerce_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text(
            'E-Commerce App',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: Loading());
        }
        if (productController.errorMessage.isNotEmpty) {
          return Center(
            child: InkWell(
              onTap: () {
                productController.fetchProducts();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  'Try again',
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
        return ListView(
          children: [
            ProductCategory(
              title: 'New Arrivals',
              products: productController.productList,
            ),
            ProductCategory(
              title: 'Trending Products',
              products: productController.productList,
            ),
          ],
        );
      }),
    );
  }
}
