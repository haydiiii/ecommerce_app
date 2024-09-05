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

class TopProductWidget extends StatelessWidget {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Increased the height to accommodate content
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is TopProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is TopProductErrorState) {
            return Center(
              child: Text(S.of(context).failedToLoadTopProducts),
            );
          } else if (cubit.topProd.isEmpty) {
            return Center(
              child: Text(S.of(context).noTopProductsAvailable),
            );
          } else {
            return ListView.separated(
              itemCount:
                  cubit.topProd.length, // Use the actual length of the list
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    pushto(
                        context,
                        SingleProductView(
                          product: cubit.topProd[index],
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            cubit.topProd[index]
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
                        const Gap(5),
                        Text(
                          cubit.topProd[index].category.toString().length > 10
                              ? '${cubit.topProd[index].category.toString().substring(0, 10)}...'
                              : cubit.topProd[index].category
                                  .toString(), // Use the actual category
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            color: AppColors.black,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cubit.topProd[index].name.toString().length > 10
                              ? '${cubit.topProd[index].name.toString().substring(0, 10)}...'
                              : cubit.topProd[index]
                                  .name, // Use the actual product name
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            color: AppColors.greyColor,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          '\$${cubit.topProd[index].price}',
                          style: getSmallStyle(
                            TextDecoration.lineThrough,
                            color: AppColors.greyColor,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${cubit.topProd[index].comparePrice}',
                          style: getSmallStyle(
                            TextDecoration.none,
                            color: AppColors.primaryColor,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Optional: Uncomment and adjust price display if needed
                        // Text(
                        //   '\$${cubit.topProd[index].originalPrice}', // Use the actual original price
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
                        //   '\$${cubit.topProd[index].discountedPrice}', // Use the actual discounted price
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
