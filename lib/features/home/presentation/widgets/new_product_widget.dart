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

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Adjusted height for better layout
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is NewProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is NewProductErrorState) {
            return Center(
              child: Text(S.of(context).failedToLoadNewProducts),
            );
          } else if (cubit.newProd.isEmpty) {
            return Center(
              child: Text(S.of(context).noNewProductsAvailable),
            );
          } else {
            return ListView.separated(
              itemCount: cubit.newProd.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      pushto(context,
                          SingleProductView(product: cubit.newProd[index]));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              cubit.newProd[index].image,
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
                            cubit.newProd[index].store.toString().length > 10
                                ? '${cubit.newProd[index].store.toString().substring(0, 10)}...'
                                : cubit.newProd[index].store.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBodyStyle(
                              color: AppColors.black,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(2),
                          Text(
                            cubit.newProd[index].name.toString().length > 10
                                ? '${cubit.newProd[index].name.toString().substring(0, 10)}...'
                                : cubit.newProd[index].name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getBodyStyle(
                              color: AppColors.greyColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(2),
                          // if (cubit.newProd[index].comparePrice == null ||
                          //     cubit.newProd[index].comparePrice == 0) ...[
                          Text(
                            '\$${cubit.newProd[index].price}',
                            style: getSmallStyle(
                              TextDecoration.lineThrough,
                              color: AppColors.greyColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cubit.newProd[index].comparePrice}',
                            style: getSmallStyle(
                              TextDecoration.none,
                              color: AppColors.primaryColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //   ] else ...[
                          //     Text(
                          //       '\$${cubit.newProd[index].comparePrice}',
                          //       style: getSmallStyle(
                          //         TextDecoration.none,
                          //         color: AppColors.primaryColor,
                          //         fontsize: 15,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ],
                        ]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(10); // Added gap between items
              },
            );
          }
        },
      ),
    );
  }
}
