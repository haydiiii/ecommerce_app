import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/core/widgets/show_custom_dialog.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_state.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:ecommerce_app/features/favourite/presentation/view_model/favourite_state.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:gap/gap.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
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
              S.of(context).myFavourite,
              style: getTitleStyle(),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
              onPressed: () {
                pushAndRemoveUntil(context, const BottomNavBar());
              },
            ),
          ),
          body: BlocConsumer<FavouriteCubit, FavouriteState>(
            listener: (context, state) {
              if (state is RemoveFavouriteSuccessStates) {
                showCustomDialog(
                  context,
                  message: S.of(context).itemRemovedFromFavourite,
                );
              } else if (state is RemoveFavouriteLoadingStates) {
                showLoadingDialog(context);
                pop(context);
              } else if (state is RemoveFavouriteErrorStates) {
                pop(context);
                showCustomDialog(
                  context,
                  message: S.of(context).somethingWentWrong,
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<FavouriteCubit>();

              if (state is FavouriteUserLoadingStates) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is FavouriteUserErrorStates) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.greyColor,
                                blurRadius: 10,
                                offset: Offset(5, 5),
                              ),
                            ],
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2.5,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                size: 50,
                                color: AppColors.primaryColor,
                              ),
                              const Gap(25),
                              Text(
                                S.of(context).somethingWentWrong,
                                style: getTitleStyle(),
                              ),
                              const Gap(10),
                              Text(
                                S.of(context).pleaseTryAgainLater,
                                style: getTitleStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(10),
                      CustomElevatedButton(
                        width: 180,
                        height: 60,
                        child: Text(
                          S.of(context).addNow,
                          style: getTitleStyle(color: AppColors.white),
                        ),
                        onPressed: () {
                          cubit.favouriteUser();
                        },
                      ),
                    ],
                  ),
                );
              }

              final favouriteData = cubit.favouriteModel?.data;

              if (favouriteData == null || favouriteData.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Gap(25),
                        Text(
                          S.of(context).yourFavouriteListIsEmpty,
                          style: getTitleStyle(fontsize: 20),
                        ),
                        const Gap(10),
                        CustomElevatedButton(
                          height: 75,
                          width: 250,
                          child: Text(
                            S.of(context).addNow,
                            style: getBodyStyle(color: AppColors.white),
                          ),
                          onPressed: () {
                            pushAndRemoveUntil(context, const BottomNavBar());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }

              return SafeArea(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: favouriteData.length,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                    var product = favouriteData[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.greyColor,
                              blurRadius: 10,
                              offset: Offset(5, 5),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.greyColor,
                            width: 1,
                          ),
                          color: AppColors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  child: Image.network(
                                    product.imageUrl,
                                    height: 160,
                                    width: 150,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.error,
                                        color: AppColors.greyColor,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const Gap(8),
                            Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getBodyStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('${product.price} LE '),
                            const Divider(color: AppColors.greyColor),
                            const Gap(2),
                            BlocListener<CartCubit, CartState>(
                              listener: (context, state) {
                                if (state is AddProductToCartSuccessState) {
                                  Navigator.pop(context);
                                } else if (state
                                    is AddProductToCartErrorState) {
                                  Navigator.pop(context);
                                  showCustomDialog(
                                    context,
                                    message: S.of(context).itemNotAddedToCart,
                                  );
                                } else if (state
                                    is AddProductToCartLoadingState) {
                                  showLoadingDialog(context);
                                }
                              },
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (state is AddProductToCartLoadingState)
                                      const CircularProgressIndicator()
                                    else
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .addProductToCart(
                                                id: product.id!,
                                                quantity: 1,
                                                context: context,
                                              );
                                        },
                                        child: const Icon(
                                          Icons.add_shopping_cart_rounded,
                                          color: AppColors.pinkColor,
                                          size: 30,
                                        ),
                                      ),
                                    InkWell(
                                      onTap: () {
                                        cubit.removeFavourite(product.id!);
                                      },
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.primaryColor,
                                        ),
                                        onPressed: () {
                                          cubit.removeFavourite(product.id!);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
