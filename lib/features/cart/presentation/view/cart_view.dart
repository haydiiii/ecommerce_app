import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/core/widgets/show_custom_dialog.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/view_model/cubit/cart_state.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/check_out_widget.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).myCart, // استخدام الترجمة
          style: getTitleStyle(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            pushAndRemoveUntil(
                context, const BottomNavBar()); // التعامل مع الرجوع للخلف
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => CartCubit()..userCart(),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is RemoveProductFromCartErrorState) {
              Navigator.pop(context);
              showCustomDialog(context,
                  message: S.of(context).somethingWentWrong); // استخدام الترجمة
            }
            else if (state is RemoveProductFromCartLoadingState) {
              showLoadingDialog(context);
            } else  if (state is RemoveProductFromCartSuccessState) {
              Navigator.pop(context);
              showCustomDialog(context,
                  message: S.of(context).itemRemoved); // استخدام الترجمة
            }
          },
          builder: (context, state) {
            final cubit = CartCubit.get(context);

            if (state is CartUserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CartUserErrorState) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                            S.of(context).somethingWentWrong, // استخدام الترجمة
                            style: getTitleStyle(),
                          ),
                          const Gap(10),
                          Text(
                            S
                                .of(context)
                                .pleaseTryAgainLater, // استخدام الترجمة
                            style: getTitleStyle(),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    CustomElevatedButton(
                      width: 180,
                      height: 60,
                      child: Text(
                        S.of(context).tryAgain, // استخدام الترجمة
                        style: getTitleStyle(color: AppColors.white),
                      ),
                      onPressed: () {
                        cubit.userCart();
                      },
                    ),
                  ],
                ),
              );
            }

            final cartData = cubit.cartModel?.data;

            if (cartData == null || cartData.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(25),
                      Text(
                        S.of(context).yourCartIsEmpty, // استخدام الترجمة
                        style: getTitleStyle(fontsize: 20),
                      ),
                      const Gap(10),
                      CustomElevatedButton(
                        height: 75,
                        width: 250,
                        child: Text(
                          S.of(context).addNow, // استخدام الترجمة
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

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Gap(15),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final itemProduct = cartData[index];
                        return CardItemCart(
                          itemProductId: itemProduct.id!,
                          itemProductImage: itemProduct.imageUrl.toString(),
                          itemProductName: itemProduct.name,
                          itemQuantity: int.parse(itemProduct.quantity),
                          itemProductPrice: itemProduct.price.toDouble(),
                          addItem: () {
                            cubit.updateProductToCart(
                                id: cartData[index].id!,
                                quantity:
                                    int.parse(cartData[index].quantity) + 1);
                          },
                          removeItem: () {
                cubit.removeProductFromCart(id: cartData[index].id!, index: index); // Pass the index here
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Gap(10),
                      itemCount: cartData.length,
                    ),
                  ),
                  CheckOutWidget(cartData: cartData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
