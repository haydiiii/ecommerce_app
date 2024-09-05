import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product/view/single_product_view.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Increased the height to accommodate content
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          if (state is BestSellerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is BestSellerErrorState) {
            return Center(
              child: Text(S.of(context).failedToLoadProducts),
            );
          } else if (cubit.bestSellingProd.isEmpty) {
            return Center(
              child: Text(S.of(context).noProductsAvailable),
            );
          } else {
            return ListView.separated(
              itemCount: cubit
                  .bestSellingProd.length, // Use the actual length of the list
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            pushto(
                                context,
                                SingleProductView(
                                    product: cubit.bestSellingProd[index]));
                          },
                          child: Image.network(
                            cubit.bestSellingProd[index]
                                .image, // Use the actual product image
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size: 50, // Adjust size as needed
                                  color: AppColors
                                      .greyColor, // You can customize the color
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Gap(5),
                      Text(
                        cubit.bestSellingProd[index].category
                                    .toString()
                                    .length >
                                10
                            ? '${cubit.bestSellingProd[index].category.toString().substring(0, 10)}...'
                            : cubit.bestSellingProd[index]
                                .category, // Use the actual brand name
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getBodyStyle(
                          color: AppColors.black,
                          fontsize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.bestSellingProd[index].name.toString().length > 10
                            ? '${cubit.bestSellingProd[index].name.toString().substring(0, 10)}...'
                            : cubit.bestSellingProd[index]
                                .name, // Use the actual main name
                        overflow: TextOverflow.ellipsis,
                        style: getBodyStyle(
                          color: AppColors.greyColor,
                          fontsize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(2),
                      Text(
                        '\$${cubit.bestSellingProd[index].price}',
                        style: getSmallStyle(
                          TextDecoration.lineThrough,
                          color: AppColors.greyColor,
                          fontsize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${cubit.bestSellingProd[index].comparePrice}',
                        style: getSmallStyle(
                          TextDecoration.none,
                          color: AppColors.primaryColor,
                          fontsize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Uncomment and update if needed
                      // Text(
                      //   '\$${cubit.bestSellingProd[index].originalPrice}', // Use the actual original price
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: getSmallStyle(
                      //     TextDecoration.lineThrough,
                      //     color: AppColors.greyColor,
                      //     fontsize: 15,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // const Gap(2),
                      // Text(
                      //   '${cubit.bestSellingProd[index].discountedPrice}', // Use the actual discounted price
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: getSmallStyle(
                      //     TextDecoration.none,
                      //     color: AppColors.black,
                      //     fontsize: 15,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(10); // Adjust the gap size as needed
              },
            );
          }
        },
      ),
    );
  }
}
