import 'package:ecommerce_app/utils/color_constants.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: CircularProgressIndicator(
        color: AppColor.primary,
      ),
    );
  }
}
