import 'package:ecommerce_app/utils/color_constants.dart';
import 'package:flutter/material.dart';

BoxDecoration boxDecoration() {
  return BoxDecoration(
      color: AppColor.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 1,
          blurRadius: 5,
        )
      ],
      borderRadius: BorderRadius.circular(8));
}
