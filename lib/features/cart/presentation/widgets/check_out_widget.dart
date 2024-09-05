import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/cart/data/cart_model.dart';
import 'package:ecommerce_app/features/order/presentation/view/order_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_elevated.dart';

class CheckOutWidget extends StatelessWidget {
  final List<Data> cartData;

  const CheckOutWidget({
    super.key,
    required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    for (var item in cartData) {
      totalPrice += item.price * int.parse(item.quantity);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total price: L.E $totalPrice',
              style: getBodyStyle(color: AppColors.white)),
          CustomElevatedButton(
            backgroundColor: AppColors.pinkColor,
            onPressed: () {

              pushto(context, OrderView(totalPrice: totalPrice,));
            },
            child: Text(
              'CheckOut',
              style: getBodyStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
