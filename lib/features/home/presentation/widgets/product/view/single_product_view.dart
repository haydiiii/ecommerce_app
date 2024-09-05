import 'dart:developer';

import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_state.dart';
import 'package:ecommerce_app/features/home/presentation/models/home_model.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SingleProductView extends StatelessWidget {
  final NewProd product;

  const SingleProductView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavouriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.name,
            style: getBodyStyle(color: AppColors.primaryColor, fontsize: 20),
          ),
          actions: [
            BlocBuilder<FavouriteCubit, FavouriteState>(
              builder: (context, state) {
                var favCubit = FavouriteCubit.get(context);
                bool isFavorite =
                    favCubit.favoriteProductIds.contains(product.id);

                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.pinkColor,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      favCubit.removeFavourite(product.id!);
                    } else {
                      favCubit.addFavourite(id: product.id!, context: context);
                    }
                  },
                );
              },
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final cartCubit = context.read<CartCubit>();
                final itemCount = cartCubit.cartModel?.data?.length ?? 0;

                return Stack(
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.shopping_cart),
                    //   onPressed: () {
                    //     // Navigate to cart screen
                    //   },
                    // ),
                    if (itemCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$itemCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image,
                  height: 250.0,
                  width: 250.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ),
              const Gap(10),
              Text(
                product.name,
                style: getBodyStyle(color: AppColors.primaryColor),
              ),
              const Gap(10),
              Text(
                product.disc,
                style: getSmallStyle(
                  TextDecoration.none,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.normal,
                  fontsize: 16,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: getSmallStyle(
                      TextDecoration.lineThrough,
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyColor,
                    ),
                  ),
                  if (product.comparePrice! > 0)
                    Text(
                      '\$${product.comparePrice!.toStringAsFixed(2)}',
                      style: getBodyStyle(
                        fontsize: 20,
                        color: AppColors.primaryColor,
                      ),
                    ),
                ],
              ),
              const Gap(10),
              Row(
                children: List.generate(
                  product.rating,
                  (index) => const Icon(
                    Icons.star,
                    color: AppColors.orangeColor,
                  ),
                ),
              ),
              const Gap(10),
              Center(
                child: BlocListener<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is AddProductToCartSuccessState) {
                      showCustomDialog(context,
                          message: "Product added to cart!");
                    } else if (state is AddProductToCartErrorState) {
                      showCustomDialog(context,
                          message: "Failed to add product to cart.");
                    }
                  },
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      if (state is AddProductToCartLoadingState) {
                        return const CircularProgressIndicator();
                      }

                      return CustomElevatedButton(
                        backgroundColor: AppColors.primaryColor,
                        textStyle: getBodyStyle(color: AppColors.white),
                        height: 75,
                        width: 250,
                        onPressed: () {
                          log("Button Pressed!"); // Check if this prints
                          context.read<CartCubit>().addProductToCart(
                                id: product.id!,
                                quantity: 1,
                                context: context,
                              );
                        },
                        child: Text(
                          'Add to Cart',
                          style: getBodyStyle(color: AppColors.white),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
