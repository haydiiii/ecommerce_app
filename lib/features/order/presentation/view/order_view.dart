import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/core/widgets/show_custom_dialog.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_cubit.dart';
import 'package:ecommerce_app/features/order/presentation/view_model/cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OrderView extends StatelessWidget {
  final double totalPrice;
  final formKey = GlobalKey<FormState>();

  OrderView({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => OrderCubit(),
          child: BlocConsumer<OrderCubit, OrderState>(
            listener: (context, state) {
              if (state is OrderSuccessState) {
                showCustomDialog(context, message: 'Order successfully');
                Future.delayed(const Duration(seconds: 5), () {
                  pushAndRemoveUntil(context, const BottomNavBar());
                });
              } else if (state is OrderLoadingState) {
                showLoadingDialog(context);
                pop(context);
              } else {
                showCustomDialog(context, message: 'Something went wrong');
              }
            },
            builder: (context, state) {
              var cubit = OrderCubit.get(context);
              return Form(
                key: formKey, // Assign the key to the Form
                child: Column(
                  children: [
                    const Gap(16),
                    CustomTxtFField(
                      prefixicon: Icons.person,
                      text: 'First Name',
                      controller: cubit.firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const Gap(5),
                    CustomTxtFField(
                      prefixicon: Icons.person,
                      text: 'Last Name',
                      controller: cubit.lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTxtFField(
                      prefixicon: Icons.phone,
                      text: 'Phone Number',
                      controller: cubit.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTxtFField(
                      prefixicon: Icons.home,
                      text: 'Address',
                      controller: cubit.addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    CustomTxtFField(
                      prefixicon: Icons.location_city,
                      text: 'Country',
                      controller: cubit.countryController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your country';
                        }
                        return null;
                      },
                    ),
                    const Gap(16),
                    // if (state is OrderLoadedState) ...[
                    //   SizedBox(
                    //     height: 200,
                    //     child: ListView.builder(
                    //       itemCount: state.orders.length,
                    //       itemBuilder: (context, index) {
                    //         final order = state.orders[index];
                    //         return ListTile(
                    //           title: Text(
                    //               'Order #${order.id} - Total: ${order.totalPrice}'),
                    //           subtitle: Text('Status: ${order.status}'),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ] else if (state is OrderLoadingState) ...[
                    //   const Center(child: CircularProgressIndicator())
                    // ] else if (state is OrderErrorState) ...[
                    //   Center(child: Text('Error: ${state.error}'))
                    // ],
                    const Gap(16),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total price: L.E $totalPrice',
                            style: getBodyStyle(color: AppColors.white),
                          ),
                          CustomElevatedButton(
                            backgroundColor: AppColors.pinkColor,
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                // If the form is valid, proceed with the order
                                cubit.orderNow(
                                    // context,
                                    // cubit.firstNameController.text,
                                    // cubit.lastNameController.text,
                                    // cubit.phoneController.text,
                                    // cubit.addressController.text,
                                    // cubit.countryController.text,
                                    );
                              } else {
                                // Show an error message if the form is not valid
                                showCustomDialog(context,
                                    message: 'Please fill in all fields');
                              }
                            },
                            child: Text(
                              'Order Now!',
                              style: getBodyStyle(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
