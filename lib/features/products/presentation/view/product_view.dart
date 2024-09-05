import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/features/products/presentation/view_model/product_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product/view/single_product_view.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product/view_model/product_states.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  ProductViewState createState() => ProductViewState();
}

class ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FavouriteCubit.get(context).favouriteUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getProducts(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit()..favouriteUser(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).products,
            style: getTitleStyle(color: AppColors.primaryColor, fontsize: 25),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
            onPressed: () {
              pushAndRemoveUntil(
                  context, const BottomNavBar()); // Handle back navigation
            },
          ),
        ),
        body: BlocConsumer<ProductCubit, ProductStates>(
          listener: (context, state) {
            if (state is ProductErrorState) {
              showCustomDialog(context, message: state.message);
            }
          },
          builder: (context, state) {
            var favCubit = FavouriteCubit.get(context);
            var cubit = ProductCubit.get(context);

            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductSuccessState) {
              if (cubit.products.isEmpty) {
                return Center(child: Text(S.of(context).noProductsAvailable));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: cubit.products.length,
                itemBuilder: (context, index) {
                  final product = cubit.products[index];
                  final isFavorite =
                      favCubit.favoriteProductIds.contains(product.id);

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Card(
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pushto(
                                    context,
                                    SingleProductView(
                                      product: product,
                                    ),
                                  );
                                },
                                child: Image.network(
                                  product.image,
                                  height: 120.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.length > 10
                                      ? product.name.substring(0, 10)
                                      : product.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(4.0),
                                Text(
                                  '${product.price} EGP',
                                  style: const TextStyle(
                                    color: AppColors.greyColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  '${product.comparePrice} EGP',
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isFavorite) {
                                        favCubit.removeFavourite(product.id!);
                                      } else {
                                        favCubit.addFavourite(
                                            id: product.id!, context: context);
                                      }
                                    });
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
                                      Icons.add_shopping_cart,
                                      color: AppColors.pinkColor,
                                    ),
                                    // icon: Text(
                                    //   S.of(context).addToCart,
                                    //   style: const TextStyle(
                                    //     color: AppColors.primaryColor,
                                    //   ),
                                    // ),
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
            } else {
              return Center(child: Text(S.of(context).somethingWentWrong));
            }
          },
        ),
      ),
    );
  }
}
