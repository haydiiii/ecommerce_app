import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardItemCart extends StatelessWidget {
  const CardItemCart({
    super.key,
    required this.itemProductId, // إضافة معرف المنتج هنا
    required this.itemProductImage,
    required this.itemProductName,
    required this.itemQuantity,
    required this.itemProductPrice,
    required this.addItem,
    required this.removeItem,
  });

  final int itemProductId;
  final String itemProductImage;
  final String itemProductName;
  final int itemQuantity;
  final double itemProductPrice;
  final Function() addItem;
  final Function() removeItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.greyColor,
                blurRadius: 5,
                offset: Offset(5, 5)),
          ],
          border: Border.all(color: AppColors.greyColor, width: 1),
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                itemProductImage,
                height: 180,
                width: 150,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.greyColor,
                    height: 180,
                    width: 150,
                    child: const Icon(
                      Icons.error_outline,
                      color: AppColors.white,
                      size: 35,
                    ),
                  );
                },
              ),
            ),
          ]),
          const Gap(8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  itemProductName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBodyStyle(fontWeight: FontWeight.w600),
                ),
                const Gap(6),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: addItem,
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        '$itemQuantity',
                        style: getBodyStyle(fontWeight: FontWeight.w600),
                      ),
                      const Gap(5),
                      IconButton(
                        onPressed: removeItem,
                        icon: const Icon(
                          Icons.remove,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(6),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$itemProductPrice LE',
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Gap(40),
                    InkWell(
                      onTap: removeItem,
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
