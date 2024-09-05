import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product/product_by_category.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (BuildContext context, HomeStates state) {
          var cubit = HomeCubit.get(context);
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(S.of(context).failedToLoadCategories),
            );
          } else if (cubit.allCategories.isEmpty) {
            return Center(
              child: Text(S.of(context).noCategoriesAvailable),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.allCategories.length,
              itemBuilder: (context, index) {
                final category = cubit.allCategories[index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      pushto(
                        context,
                        CategoryProductsScreen(
                          categoryName: category.name,
                          id: category.id,
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            category.imageUrl,
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
                        Container(
                          width: 100, // Ensure the container width is fixed
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Center(
                            child: Text(
                              category.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines:
                                  2, // Allow the text to wrap to two lines
                              textAlign: TextAlign.center,
                              style: getBodyStyle(
                                color: AppColors.white,
                                fontsize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
