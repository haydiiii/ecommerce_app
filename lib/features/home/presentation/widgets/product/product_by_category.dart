import 'dart:developer';
import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product/view/single_product_view.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_cubit.dart';

class CategoryProductsScreen extends StatelessWidget {
  final int id;
  final String categoryName;

  const CategoryProductsScreen({
    super.key,
    required this.id,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: getTitleStyle(color: AppColors.primaryColor, fontsize: 25),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit()..getProductByCategory(id: id),
          ),
          BlocProvider(
            create: (context) => CartCubit(),
          ),
          BlocProvider(
            create: (context) =>
                FavouriteCubit()..favouriteUser(), // Ensure this is initialized
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            var homeCubit = HomeCubit.get(context);
            var favCubit = FavouriteCubit.get(context);

            if (state is ProductByCateryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductByCateryErrorState) {
              return Center(child: Text(state.message));
            } else if (state is ProductByCaterySuccessState) {
              if (homeCubit.productByCategory.isEmpty) {
                return const Center(child: Text('No products available'));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: homeCubit.productByCategory.length,
                itemBuilder: (context, index) {
                  final product = homeCubit.productByCategory[index];
                  final isFavorite =
                      favCubit.favoriteProductIds.contains(product.id);

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pushto(
                                  context,
                                  SingleProductView(
                                    product: product,
                                  ));
                            },
                            child: Stack(
                              children: [
                                Image.network(
                                  product.image,
                                  height: 120.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    log('Failed to load image: ${product.image}');
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.length > 10
                                      ? '${product.name.substring(0, 10)}...'
                                      : product.name,
                                  style: getTitleStyle(
                                      color: AppColors.primaryColor,
                                      fontsize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Gap(4.0),
                                Text(
                                  '\$${product.price}',
                                  style: getSmallStyle(
                                    TextDecoration.lineThrough,
                                  ),
                                ),
                                if (product.comparePrice != null)
                                  Text(
                                    '\$${product.comparePrice}',
                                    style: getBodyStyle(
                                        color: AppColors.primaryColor,
                                        fontsize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (isFavorite) {
                                      favCubit.removeFavourite(product.id!);
                                    } else {
                                      favCubit.addFavourite(
                                          id: product.id!, context: context);
                                    }
                                  },
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: isFavorite
                                        ? AppColors.pinkColor
                                        : Colors.grey,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.shopping_cart,
                                      color: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CartCubit>()
                                          .addProductToCart(
                                            id: product.id!,
                                            quantity: 1,
                                            context: context,
                                          );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
