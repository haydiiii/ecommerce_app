import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HotProductWidget extends StatelessWidget {
  const HotProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250, // Increased the height to accommodate content
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is HotProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else if (state is HotProductErrorState) {
          return const Center(
            child: Text('Failed to load new products'),
          );
        } else if (cubit.hotProd.isEmpty) {
          return const Center(
            child: Text('No categories available'),
          );
        } else {
          {
            return ListView.separated(
              itemCount: cubit.hotProd.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            cubit.hotProd[index].image,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          cubit.hotProd[index].store,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            color: AppColors.black,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cubit.hotProd[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: getBodyStyle(
                            color: AppColors.greyColor,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          '\$${cubit.hotProd[index].price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getSmallStyle(
                            TextDecoration.lineThrough,
                            color: AppColors.greyColor,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(2),
                        Text(
                          '\$${cubit.hotProd[index].comparePrice}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getSmallStyle(
                            TextDecoration.none,
                            color: AppColors.black,
                            fontsize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
          // } else {
          //   return const SizedBox(
          //     height: 10,
          //   );
          // }
        }
      }),
    );
  }
}
