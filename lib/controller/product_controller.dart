import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  List<ProductModel> productList = [];

  void fetchProducts() async {
    try {
      isLoading(true);
      productList = await GetProduct.fetchProducts();

      Fluttertoast.showToast(
        msg: "Products fetched successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.primary,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      errorMessage(e.toString());

      Fluttertoast.showToast(
        msg: "Error fetching products: ${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      isLoading(false);
    }
  }
}
