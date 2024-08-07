import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
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
            return const Center(
              child: Text('Failed to load new products'),
            );
          } else if (cubit.newProd.isEmpty) {
            return const Center(
              child: Text('No categories available'),
            );
          } else {
            return ListView.separated(
              itemCount: cubit.newProd.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {},
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
                          ),
                        ),
                        const Gap(5),
                        Text(
                          cubit.newProd[index].store,
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
                          cubit.newProd[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            color: AppColors.greyColor,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(2),
                        if (cubit.newProd[index].comparePrice == null &&
                            cubit.newProd[index].comparePrice == 0) ...[
                          Text(
                            '\$${cubit.newProd[index].comparePrice}',
                            style: getSmallStyle(
                              null,
                              color: AppColors.black,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cubit.newProd[index].price}',
                            style: getSmallStyle(
                              TextDecoration.lineThrough,
                              color: AppColors.greyColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ] else ...[
                          Text(
                            '\$${cubit.newProd[index].price}',
                            style: getSmallStyle(
                              TextDecoration.none,
                              color: AppColors.primaryColor,
                              fontsize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        // Text(
                        //   '\$${cubit.newProd[index].price}',
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
                        //   '\$${cubit.newProd[index].comparePrice}',
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
                return const Gap(10); // Added gap between items
              },
            );
          }
        },
      ),
    );
  }
}
